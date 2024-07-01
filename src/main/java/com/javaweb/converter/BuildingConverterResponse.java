package com.javaweb.converter;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingConverterResponse {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingSearchResponse toBuildingSearchResponse (BuildingDTO buildingDTO){
        BuildingSearchResponse buildingSearchResponse=modelMapper.map(buildingDTO,BuildingSearchResponse.class);
        return buildingSearchResponse;
    }
}
