package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public interface BuildingService{
    ResponseDTO listSaffs(Long buildingId );
    List<BuildingDTO> findAll(Map<String, Object> params,ArrayList<String> typeCodes);
    BuildingDTO findBuildingBYId(Long id);
    void addOrUpdateBuilding(BuildingDTO buildingDTO);
    void deleteBuilding(List<Long> id);
    void assignBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
    List<BuildingDTO> getBuilding(String searchValue, Pageable pageable);
}
