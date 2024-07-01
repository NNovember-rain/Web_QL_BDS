package com.javaweb.controller.admin;


import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.CustomerConverterResponse;
import com.javaweb.enums.District;
import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.*;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@RestController
public class CustomerController {
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerConverterResponse customerConverterResponse;

    @RequestMapping(value =  "/admin/customer-list" ,method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute CustomerSearchRequest customerSearchRequest,
                                     @RequestParam Map<String, Object> params,
                                     @ModelAttribute(SystemConstant.MODEL) CustomerDTO model,
                                     HttpServletRequest request){

        ModelAndView mav= new ModelAndView("/admin/customer/list");

        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId=SecurityUtils.getPrincipal().getId();
            params.put("staffId",staffId);
            mav.addObject("listCustomer",customerService.findAll(params));
        }
        else{
            mav.addObject("listCustomer",customerService.findAll(params));
        }

        List<CustomerSearchResponse> customerSearchResponses = new ArrayList<>();
        Collections.reverse(customerSearchResponses);
        mav.addObject("modelSearch",customerSearchRequest);
        mav.addObject("listStaff",userService.getStaffs());
        return mav;
    }

    // add or update
    @RequestMapping(value = "/admin/customer-edit" ,method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute CustomerDTO customerDTO, HttpServletRequest request){
        ModelAndView mav= new ModelAndView("/admin/customer/edit");
        mav.addObject("CustomerEdit",customerDTO);
        mav.addObject("listStatus", Status.type());
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView customerAddOrUpdateEdit(@PathVariable Long id){
        ModelAndView mav= new ModelAndView("/admin/customer/edit");
        CustomerDTO customerDTO=customerService.findById(id);
        List<TransactionDTO> transactionDTOSCSKH=customerService.findTranSactionByCSKH(id);
        List<TransactionDTO> transactionDTOSDDX=customerService.findTranSactionByDDX(id);
        mav.addObject("transactionCSKH", transactionDTOSCSKH);
        mav.addObject("transactionDDX", transactionDTOSDDX);
        mav.addObject("TransactionType", TransactionType.type());
        mav.addObject("listStatus", Status.type());
        mav.addObject("CustomerEdit",customerDTO);
        return mav;
    }


    @PostMapping(value = "contact/customer" )
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        customerService.saveOrUpdate(customerDTO);
    }

    // delete
    @DeleteMapping(value ="/admin/customer/{ids}" )
    public void deleteCustomer(@RequestBody List<Long> ids){
        customerService.delete(ids);
    }

    //Assignment
    @GetMapping(value = "customer/{id}/staffs")
    public ResponseDTO getStaffs(@PathVariable Long id){
        return customerService.loadStaff(id);
    }

    @PostMapping("/customer/assignment")
    public void updateAssign(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.updateAssign(assignmentCustomerDTO);
    }


    // add or update transaction
    @PostMapping("/admin/customer/transaction")
    public void addOrUpdateTransaction (@RequestBody TransactionDTO transactionDTO){
        customerService.adOrUpdateTransaction(transactionDTO);
    }

}
