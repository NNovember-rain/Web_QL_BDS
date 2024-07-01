package com.javaweb.converter;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverterResponse {

    @Autowired
    private ModelMapper modelMapper;
    public CustomerSearchResponse toCustomerSearchResponse (CustomerDTO customer){
        CustomerSearchResponse buildingSearchResponse=modelMapper.map(customer,CustomerSearchResponse.class);
        return buildingSearchResponse;
    }

}
