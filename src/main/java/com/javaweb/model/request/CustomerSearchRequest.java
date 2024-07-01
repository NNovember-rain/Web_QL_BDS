package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter

public class CustomerSearchRequest  extends AbstractDTO {
    private String createdBy;
    private Date modifiedDate;
    private String fullName;
    private String phone;
    private String email;
    private Long staffId;
}
