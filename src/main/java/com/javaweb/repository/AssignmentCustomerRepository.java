package com.javaweb.repository;

import com.javaweb.entity.AssignmentCustomerEntity;
import com.javaweb.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AssignmentCustomerRepository extends JpaRepository<AssignmentCustomerEntity,Long> {
    void deleteByCustomerId(Long id);
}
