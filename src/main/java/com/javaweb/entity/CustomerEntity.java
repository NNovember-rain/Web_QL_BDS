package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Getter
@Setter
@Entity
@Table(name = "customer")
public class CustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="fullname")
    private String fullName;

    @Column(name="phone")
    private String phone;

    @Column(name="email")
    private String email;

    @Column(name="is_active")
    private Long isActive=1L;


    @Column(name="companyname")
    private String companyName;

    @Column(name="demand")
    private String demand;

    @Column(name="status")
    private String status;

    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "createdby")
    private String createdBy;

    @Column(name = "modifieddate")
    private Date modifiedDate;

    @Column(name = "modifiedby")
    private String modifiedBy;

    @OneToMany(mappedBy="customer",fetch=FetchType.LAZY)
    private List<AssignmentCustomerEntity> assignmentCustomers=new ArrayList<>();

    @OneToMany(mappedBy="customer",fetch=FetchType.LAZY)
    private List<TransactionEntity> transactions=new ArrayList<>();


}
