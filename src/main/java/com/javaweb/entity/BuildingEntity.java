package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "building")
public class BuildingEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="managername")
    private String managerName;

    @Column(name="name")
    private String name;

    @Column(name="street")
    private String street;

    @Column(name="ward")
    private String ward;

    @Column(name="district")
    private String district;

    @Column(name="structure")
    private String structure;

    @Column(name="managerphone")
    private String managerPhone;

    @Column(name="floorarea")
    private Long floorArea;

    @Column(name="numberofbasement")
    private Long numberOfBasement;

    @Column(name="rentprice")
    private Long rentPrice;

    @Column(name="brokeragefee")
    private Double brokerageFee;

    @Column(name="servicefee")
    private String serviceFee;

    @Column(name="type")
    private String type;

    @Column(name="rentpricedescription")
    private String rentPriceDescription;

    @Column(name="avatar")
    private String avatar;

    @ManyToMany
    @JoinTable(name="Assignmentbuilding",
            joinColumns=@JoinColumn(name="buildingid",nullable=false),
            inverseJoinColumns=@JoinColumn(name="staffid",nullable=false))
    private List<UserEntity> users=new ArrayList<>();

    @OneToMany(mappedBy="building",fetch=FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REMOVE},orphanRemoval = true)
    private List<RentAreaEntity> rentareas=new  ArrayList<>();


}
