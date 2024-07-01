package com.javaweb.repository;
import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends  CustomerRepositoryCustom,JpaRepository<CustomerEntity, Long> {// Đảm bảo phương thức này tồn tại

}
