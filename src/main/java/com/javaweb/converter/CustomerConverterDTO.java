package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import static jdk.nashorn.internal.objects.NativeDebug.map;

@Component
public class CustomerConverterDTO {
    @Autowired
    private ModelMapper modelMapper;
    public CustomerDTO toCustomerDTO(CustomerEntity item){
        return modelMapper.map(item,CustomerDTO.class);
    }
}
