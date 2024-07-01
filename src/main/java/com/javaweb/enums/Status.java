package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;


public enum Status {
    dang_xu_li("Đang xử lí"),
    chua_xu_li("Chưa xử lí"),
    da_xu_li("Đã xử lí");

    private final String statusName;

    Status(String statusName){
        this.statusName=statusName;
    }
    public static Map<String,String> type(){
        Map<String,String> status=new TreeMap<>();
        for(Status it : Status.values()){
            status.put(it.toString(),it.statusName);
        }
        return status;
    }
}
