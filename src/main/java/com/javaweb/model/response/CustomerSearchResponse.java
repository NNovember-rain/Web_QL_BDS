package com.javaweb.model.response;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CustomerSearchResponse {
    private Long id;
    private String fullName;
    private String phone;
    private String email;
    private String demand;
    private String createdby;
    private Date createDate;
    private String status;
}
