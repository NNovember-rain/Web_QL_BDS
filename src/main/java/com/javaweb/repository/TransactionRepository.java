package com.javaweb.repository;


import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TransactionRepository extends JpaRepository<TransactionEntity,Long> {
    List<TransactionEntity> findByCustomerIdAndCode(Long id,String note);
}
