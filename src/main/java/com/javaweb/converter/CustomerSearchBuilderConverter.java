package com.javaweb.converter;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.utils.MapUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Map;

@Component
public class CustomerSearchBuilderConverter {
    public CustomerSearchBuilder toCustomerSearchBuilder(Map<String,Object> params) {
        CustomerSearchBuilder customerSearchBuilder =CustomerSearchBuilder.builder()
                .fullName(MapUtils.getObject(params, "fullName", String.class))
                .phone(MapUtils.getObject(params, "phoneNumber", String.class))
                .email(MapUtils.getObject(params, "email", String.class))
                .staffId(MapUtils.getObject(params, "staffId", Long.class))
                .build();

        return customerSearchBuilder;
    }
}
