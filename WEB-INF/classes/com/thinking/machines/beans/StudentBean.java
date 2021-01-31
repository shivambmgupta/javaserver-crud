package com.thinking.machines.beans;
public class StudentBean implements java.io.Serializable {

    private String name;
    private String gender;
    private int rollNumber;
    private String address;
    private String indian;
 
    public StudentBean() {}

    public StudentBean(String name, String gender, String address, String indian, int rollNumber){
        this.name = name;
        this.address = address;
        this.indian = indian;
        this.gender = gender;
        this.rollNumber = rollNumber;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }

    public void setGender(String gender){
        this.gender = gender;
    }

    public String getGender(){
        return this.gender;
    }

    public void setRollNumber(int rollNumber){
        this.rollNumber = rollNumber;
    }

    public int getRollNumber(){
        return this.rollNumber;
    }

    public void setAddress(String address){
        this.address = address;
    }

    public String getAddress(){
        return this.address;
    }

    public void setIndian(String indian){
        this.indian = indian;
    }

    public String getIndian(){
        return this.indian;
    }

}