package com.javaweb.service.impl;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.converter.CustomerConverterDTO;
import com.javaweb.converter.CustomerSearchBuilderConverter;
import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.AssignmentCustomerEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentCustomerRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerSearchBuilderConverter customerSearchBuilderConverter;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverterDTO customerConverterDTO;

    @Autowired
    private TransactionConverter transactionConverter;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AssignmentCustomerRepository assignmentCustomerRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    // tim kiem
    @Override
    public List<CustomerDTO> findAll(Map<String, Object> params) {
        CustomerSearchBuilder customerSearchBuilder=customerSearchBuilderConverter.toCustomerSearchBuilder(params);
        List<CustomerEntity> customerEntities = customerRepository.findSearchAll(customerSearchBuilder);
        List<CustomerDTO> customerDTOS=new ArrayList<>();
        for(CustomerEntity it:customerEntities){
            StaffResponseDTO staffResponseDTO=new StaffResponseDTO();
            customerDTOS.add(customerConverterDTO.toCustomerDTO(it));
        }
        return customerDTOS;
    }

    // add or update
    @Override
    public void saveOrUpdate(CustomerDTO customerDTO) {
        CustomerEntity customerEntity=modelMapper.map(customerDTO,CustomerEntity.class);
        customerRepository.save(customerEntity);
    }

    @Override
    public CustomerDTO findById(Long id) {
        return customerConverterDTO.toCustomerDTO(customerRepository.findById(id).orElse(null));
    }

    // xoa mem
    @Override
    public void delete(List<Long> ids) {
        List<CustomerEntity> customerEntities=customerRepository.findAllById(ids);
        for(CustomerEntity customerEntity:customerEntities){
            customerEntity.setIsActive(0L);
        }
        customerRepository.saveAll(customerEntities);
    }

    @Override
    public ResponseDTO loadStaff(Long id) {
        CustomerEntity customerEntity=customerRepository.findById(id).orElse(null);
        List<UserEntity> staffs=userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<AssignmentCustomerEntity> assignmentCustomerEntities=customerEntity.getAssignmentCustomers();
        List<UserEntity> staffAssign=new ArrayList<>();
        ResponseDTO responseDTO=new ResponseDTO();

        for(AssignmentCustomerEntity it:assignmentCustomerEntities){
            staffAssign.add(it.getUser());
        }
        List<StaffResponseDTO> staffResponseDTOS=new ArrayList<>();

        for(UserEntity it:staffs){
            StaffResponseDTO staffResponseDTO=new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());

            if(staffAssign.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setMessage("success");
        responseDTO.setData(staffResponseDTOS);
        return responseDTO;

    }

    @Override
    public void updateAssign(AssignmentCustomerDTO assignmentCustomerDTO) {
        List<AssignmentCustomerEntity> assignmentCustomerEntities=new ArrayList<>();
        CustomerEntity customerEntity=customerRepository.findById(assignmentCustomerDTO.getCustomerId()).orElse(null);
        for(Long i:assignmentCustomerDTO.getStaffs()){
            AssignmentCustomerEntity assignmentCustomerEntity=new AssignmentCustomerEntity();
            assignmentCustomerEntity.setCustomer(customerEntity);
            UserEntity userEntity=userRepository.findById(i).orElse(null);
            assignmentCustomerEntity.setUser(userEntity);
            assignmentCustomerEntities.add(assignmentCustomerEntity);
        }
        assignmentCustomerRepository.deleteByCustomerId(assignmentCustomerDTO.getCustomerId());
        assignmentCustomerRepository.saveAll(assignmentCustomerEntities);
    }

    @Override
    public List<TransactionDTO> findTranSactionByCSKH(Long id) {
        List<TransactionEntity> transactionEntities=transactionRepository.findByCustomerIdAndCode(id,"CSKH");
        List<TransactionDTO> transactionDTOS=new ArrayList<>();
        for(TransactionEntity it:transactionEntities){
            transactionDTOS.add(transactionConverter.toTransactionDTO(it));
        }
        return transactionDTOS;

    }

    @Override
    public List<TransactionDTO> findTranSactionByDDX(Long id) {
        List<TransactionEntity> transactionEntities=transactionRepository.findByCustomerIdAndCode(id,"DDX");
        List<TransactionDTO> transactionDTOS=new ArrayList<>();
        for(TransactionEntity it:transactionEntities){
            transactionDTOS.add(transactionConverter.toTransactionDTO(it));
        }
        return transactionDTOS;

    }

    @Override
    public void adOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity=transactionConverter.toTransactionEntity(transactionDTO);
        LocalDate localDate = LocalDate.now();
        Date sqlDate = Date.valueOf(localDate);
        transactionEntity.setCreatedDate(sqlDate);
        transactionRepository.save(transactionEntity);
    }


}
