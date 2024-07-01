package com.javaweb.repository.custom.impl;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;


@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void checkJoin(CustomerSearchBuilder customerSearchBuilder, StringBuilder sql) {
        if(customerSearchBuilder.getStaffId()!=null){
            sql.append(" inner join assignmentcustomer `as` on `as`.customerid=c.id  ");
        }
    }
    public void addQerry(CustomerSearchBuilder customerSearchBuilder, StringBuilder where){
        if(customerSearchBuilder.getStaffId()!=null){
            where.append("AND `as`.staffid = "+customerSearchBuilder.getStaffId()+" ");
        }
        try {
            Field[] fields= CustomerSearchBuilder.class.getDeclaredFields();
            for (Field item:fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId")) {
                    Object value=item.get(customerSearchBuilder);
                    if(value!=null) {
                        if(!NumberUtils.isNumber(value.toString())) {
                            where.append(" AND c."+fieldName+" LIKE '%"+value+"%' ");
                        }else{
                            where.append(" AND c."+fieldName+" ='"+value+"' ");
                        }
                    }
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public  List<CustomerEntity> excuteQuerry(StringBuilder sql) {
        Query query=entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public List<CustomerEntity> findSearchAll(CustomerSearchBuilder customerSearchBuilder) {
        StringBuilder sql = new StringBuilder("select c.* from customer c ");
        StringBuilder where = new StringBuilder(" where 1=1 AND c.is_active=1 ");
        checkJoin(customerSearchBuilder,sql);
        addQerry(customerSearchBuilder,where);
        where.append(" group by c.id ;");
        sql.append(where);
        return excuteQuerry(sql);
    }
}


