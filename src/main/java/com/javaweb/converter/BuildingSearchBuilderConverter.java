package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Map;



@Component // thằng này chỉ có tác dụng cho biết file này là một cái bean
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(Map<String,Object> params,ArrayList<String>typeCodes) {
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(params, "name", String.class))
                .setFloorArea(MapUtils.getObject(params, "floorArea", Long.class))
                .setNumberOfBasement(MapUtils.getObject(params, "numberOfBasement", Long.class))
                .setWard(MapUtils.getObject(params, "ward", String.class))
                .setDistrict(MapUtils.getObject(params, "district", String.class))
                .setStreet(MapUtils.getObject(params, "street", String.class))
                .setManagerName(MapUtils.getObject(params, "managerName", String.class))
                .setManagerPhoneNumber(MapUtils.getObject(params, "managerPhoneNumber", String.class))
                .setDirection(MapUtils.getObject(params, "direction", String.class))
                .setLevel(MapUtils.getObject(params, "level", String.class))
                .setRentPriceFrom(MapUtils.getObject(params, "rentPriceFrom", Long.class))
                .setRentPriceTo(MapUtils.getObject(params, "rentPriceTo", Long.class))
                .setAreaFrom(MapUtils.getObject(params, "areaFrom", Long.class))
                .setAreaTo(MapUtils.getObject(params, "areaTo", Long.class))
                .setStaffId(MapUtils.getObject(params, "staffId", Long.class))
                .setTypeCode(typeCodes)
                .build();
        return buildingSearchBuilder;
    }
}
