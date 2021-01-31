package com.thinking.machines.beans;
public class CityBean implements java.io.Serializable {
    
    private String name;
    private int code;

    public CityBean() {
    }

    public CityBean(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return this.code;
    }

}