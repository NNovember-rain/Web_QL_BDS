package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.BuildingConverterResponse;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.MessageUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private UserService userService;
    @Autowired
    private BuildingService buildingService;
    @Autowired
    BuildingConverterResponse buildingConverterResponse;
    @Autowired
    private MessageUtils messageUtil;

    @RequestMapping(value =  "/admin/building-list" ,method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest,
                                     @RequestParam Map<String, Object> params,
                                     @RequestParam(name = "typeCode", required = false) ArrayList<String> typeCodes,
                                     @ModelAttribute(SystemConstant.MODEL) BuildingDTO model,
                                     HttpServletRequest request){
        ModelAndView mav= new ModelAndView("/admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
        List<BuildingSearchResponse> responseList= new ArrayList<>();

        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId=SecurityUtils.getPrincipal().getId();
            params.put("staffId",staffId);
            mav.addObject("buildingList",buildingService.findAll(params,typeCodes));
        }
        else{
            mav.addObject("buildingList",buildingService.findAll(params,typeCodes));
        }
        mav.addObject(SystemConstant.MODEL, model);
        mav.addObject("listStaff",userService.getStaffs());
        mav.addObject("listDistrict", District.type());
        mav.addObject("listTypeCode", TypeCode.type());
        return mav;
    }

    // thêm tòa nhà
    @RequestMapping(value = "/admin/building-edit" ,method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav= new ModelAndView("/admin/building/edit");
        mav.addObject("buildingEdit",buildingDTO);
        mav.addObject("listDistrict", District.type());
        mav.addObject("listTypeCode", TypeCode.type());
        return mav;
    }

    //sửa tòa nhà
    @RequestMapping(value = "/admin/building-edit-{id}" ,method = RequestMethod.GET)
    public ModelAndView buildingEditrr(@PathVariable("id") Long Id,
                                       HttpServletRequest request){
        ModelAndView mav= new ModelAndView("/admin/building/edit");
        BuildingDTO buildingDTO=buildingService.findBuildingBYId(Id);
        buildingDTO.setId(Id);
        mav.addObject("listDistrict", District.type());
        mav.addObject("listTypeCode", TypeCode.type());
        mav.addObject("buildingEdit",buildingDTO);
        return mav;
    }

}
