package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;

import javax.transaction.Transaction;
import javax.xml.ws.Response;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<CustomerDTO> findAll(Map<String, Object> params);
    void saveOrUpdate(CustomerDTO customerDTO);
    CustomerDTO findById(Long id);
    void delete(List<Long> ids);
    ResponseDTO loadStaff(Long id);
    void updateAssign(AssignmentCustomerDTO assignmentCustomerDTO);
    List<TransactionDTO> findTranSactionByCSKH(Long id);
    List<TransactionDTO> findTranSactionByDDX(Long id);
    void adOrUpdateTransaction(TransactionDTO transactionDTO);
}
