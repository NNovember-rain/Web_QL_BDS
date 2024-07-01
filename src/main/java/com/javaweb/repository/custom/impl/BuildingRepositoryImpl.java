package com.javaweb.repository.custom.impl;
import java.lang.reflect.Field;
import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public static void checkJoinTable(BuildingSearchBuilder buildingSearchBuilder,StringBuilder sql) {
        Long staffid=buildingSearchBuilder.getStaffId();
        if(staffid!=null) {
            sql.append(" INNER JOIN assignmentbuilding ab on ab.buildingid=b.id ");
        }
        Long areafrom= buildingSearchBuilder.getAreaFrom();
        Long areato=buildingSearchBuilder.getAreaTo();
        if(areafrom!=null || areato!=null) {
            sql.append(" INNER JOIN rentarea ra on ra.buildingid = b.id ");
        }
    }
    public static void addQuerryNomal(StringBuilder where,BuildingSearchBuilder buildingSearchBuilder) {
        try {
            Field[] fields=BuildingSearchBuilder.class.getDeclaredFields();
            for (Field item:fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")) {
                    Object value=item.get(buildingSearchBuilder);
                    if(value!=null) {
                        if(NumberUtils.isNumber(value.toString())) {
                            where.append(" AND b."+fieldName+"="+value+" ");
                        }
                        else {
                            where.append(" AND b."+fieldName+" LIKE '%"+value+"%'");
                        }
                    }
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    
    public static void addQuerrySpecial(BuildingSearchBuilder buildingSearchBuilder,StringBuilder where) {
        Long staffid=buildingSearchBuilder.getStaffId();
        if(staffid!=null) {
            where.append(" AND ab.staffId="+staffid+" ");
        }

        Long areafrom=buildingSearchBuilder.getAreaFrom();
        Long areato=buildingSearchBuilder.getAreaTo();
        if(areafrom!=null) {
            where.append(" AND ra.value >="+areafrom+" ");
        }
        if(areato!=null) {
            where.append(" AND ra.value <="+areato+" ");
        }

        Long rentpricefrom=buildingSearchBuilder.getRentPriceFrom();
        Long rentpriceto=buildingSearchBuilder.getRentPriceTo();
        if(rentpricefrom!=null) {
            where.append(" AND b.rentprice >="+rentpricefrom+" ");
        }
        if(rentpriceto!=null) {
            where.append(" AND b.rentprice <="+rentpriceto +" ");
        }
        List<String> typeCodes=buildingSearchBuilder.getTypeCode();
        if(typeCodes!=null && typeCodes.size()!=0) {
            String s="";
            for (String x:typeCodes) {
                s+=x+",";
            }
            s=s.substring(0,s.length()-1);
            where.append( "AND b.type LIKE '%"+s+"%' ");
        }
    }
    public  List<BuildingEntity> solveResult(StringBuilder sql) {
        Query query=entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
        StringBuilder sql=new StringBuilder("SELECT b.* FROM building b ");
        StringBuilder where=new StringBuilder(" WHERE 1=1 ");
        checkJoinTable(buildingSearchBuilder,sql);
        addQuerryNomal(where,buildingSearchBuilder);
        addQuerrySpecial(buildingSearchBuilder,where);
        where.append(" GROUP BY b.id; ");
        sql.append(where.toString());
        return solveResult(sql);
    }
}
