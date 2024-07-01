package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem");


    private final String TransactionName;

    TransactionType(String TransactionName){
        this.TransactionName=TransactionName;
    }
    public static Map<String,String> type(){
        Map<String,String> transactiontype =new TreeMap<>();
        for(TransactionType it : TransactionType.values()){
            transactiontype.put(it.toString(),it.TransactionName);
        }
        return transactiontype;
    }
}
