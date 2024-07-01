package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TransactionDTO extends AbstractDTO{
    private String note;
    private String code;
    private Long staffId;
    private Long customerId;
}
