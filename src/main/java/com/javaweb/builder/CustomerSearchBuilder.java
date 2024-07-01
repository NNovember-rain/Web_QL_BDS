package com.javaweb.builder;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class CustomerSearchBuilder {
    private String fullName;
    private String phone;
    private String email;
    private Long staffId;
}
