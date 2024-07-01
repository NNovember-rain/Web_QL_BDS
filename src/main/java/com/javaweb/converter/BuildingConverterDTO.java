package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverterDTO {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingDTO toBuildingDTO(BuildingEntity item){
        BuildingDTO tmp=modelMapper.map(item,BuildingDTO.class);
        List<RentAreaEntity> rentAreaEntities=item.getRentareas();
        String Rentarea=rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        tmp.setAddress(item.getDistrict()+","+item.getStreet()+","+item.getWard());
        tmp.setRentArea(Rentarea);
        if(item.getType()!=null && !item.getType().isEmpty()) {
            String[] type = item.getType().split(",");
            List<String> typecodes = new ArrayList<>();
            for (String i : type) {
                typecodes.add(i);
            }
            tmp.setTypeCode(typecodes);
        }
        return tmp;
    }

    public BuildingEntity toBuildingEntity(BuildingDTO item){
        BuildingEntity tmp=modelMapper.map(item,BuildingEntity.class);
        String s="";
        for(String x:item.getTypeCode()){
            s+=x+",";
        }
        tmp.setType(s.substring(0,s.length()-1));
        return tmp;
    }


}
