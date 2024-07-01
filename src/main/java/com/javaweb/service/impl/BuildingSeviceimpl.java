package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverterDTO;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;

import com.javaweb.service.BuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class BuildingSeviceimpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private BuildingConverterDTO buildingConverterDTO;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Override
    public ResponseDTO listSaffs(Long buildingId) {
        BuildingEntity building=buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs =userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssign=building.getUsers();
        List<StaffResponseDTO> staffResponseDTOS=new ArrayList<>();
        ResponseDTO responseDTO=new ResponseDTO();

        for(UserEntity it:staffs){
            StaffResponseDTO staffResponseDTO=new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssign.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else staffResponseDTO.setChecked("");
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingDTO> findAll(Map<String, Object> params,ArrayList<String> typeCodes) {
        BuildingSearchBuilder buildingSearchBuilder=buildingSearchBuilderConverter.toBuildingSearchBuilder(params, typeCodes);
        List<BuildingEntity> buildingEntities=buildingRepository.findAll(buildingSearchBuilder);
        List<BuildingDTO> result=new ArrayList<>();
        for(BuildingEntity it:buildingEntities){
            BuildingDTO tmp=buildingConverterDTO.toBuildingDTO(it);
            result.add(tmp);
        }
        return result;
    }

    @Override
    public BuildingDTO findBuildingBYId(Long id) {
        BuildingEntity buildingEntity= buildingRepository.findById(id).get();
        BuildingDTO buildingDTO=buildingConverterDTO.toBuildingDTO(buildingEntity);
        return buildingDTO;
    }

    @Override
    public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity=buildingConverterDTO.toBuildingEntity(buildingDTO);
        if(buildingDTO.getId()!=null) {
            BuildingEntity building = buildingRepository.findById(buildingDTO.getId()).orElse(null);
            if(building.getUsers()!=null) {
                List<UserEntity> userEntities = building.getUsers();
                buildingEntity.setUsers(userEntities);
            }
        }
        buildingEntity.setAvatar(saveThumbnail(buildingDTO)); // luu duong dan cua anh
        // save vào tòa nhà
        //xử lí save rentare
        if(!buildingDTO.getRentArea().isEmpty() && buildingDTO.getRentArea()!=null) {
            String[] rentareas = buildingDTO.getRentArea().split(",");
            List<RentAreaEntity> rentAreas = new ArrayList<>();
            for (String s : rentareas) {
                RentAreaEntity rentArea = new RentAreaEntity();
                rentArea.setValue(Long.parseLong(s));
                rentArea.setBuilding(buildingEntity);
                rentAreas.add(rentArea);
            }
            buildingEntity.setRentareas(rentAreas);
        }
        buildingRepository.save(buildingEntity);

    }

    @Override
    public void deleteBuilding(List<Long> id) {
        buildingRepository.deleteAllByIdIn(id);
    }

    @Override
    public void assignBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity= buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).orElse(null);

        if(assignmentBuildingDTO.getStaffs()!=null && buildingEntity!=null) {
            List<UserEntity> userEntities = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
            buildingEntity.setUsers(userEntities);
            buildingRepository.save(buildingEntity);
        }

    }
    private String saveThumbnail(BuildingDTO buildingDTO) {
        String path = "/building/" + buildingDTO.getImageName(); // tao duong dan
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingDTO.getAvatar()) {
                if (!path.equals(buildingDTO.getAvatar())) { // kiem tra xem anh da ton tai chua neu ton tai r thi xoa de cap nhat lai, tranh bi anh trung nhau
                    File file = new File("C://home/office/building/" + buildingDTO.getAvatar());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);

        }
        return path;
    }


    @Override
    public List<BuildingDTO> getBuilding(String searchValue, Pageable pageable) {
        return null;
    }


}
