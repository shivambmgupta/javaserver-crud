package com.thinking.machines.school;
import java.sql.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import com.thinking.machines.beans.*;
import com.thinking.machines.dao.*;

public class TableIteratorTagHandler extends BodyTagSupport  {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String table;
    private String name;
    private String orderby;
    private int index = 0;

    public TableIteratorTagHandler()  {
        reset();
    } 

    private void reset()  {
        this.table = "";
        this.name = "";
        this.orderby = "";
        this.index = 0;
        this.connection = null;
        this.preparedStatement = null;
        this.resultSet = null;
    } 

    public void setTable(String table) {
        this.table = table;
    } 

    public String getTable() {
        return this.table;
    } 

    public void setName(String name) {
        this.name = name;
    } 

    public String getName() {
        return this.name;
    } 

    public void setOrderby(String orderby) {
        this.orderby = orderby;
    } 

    public String getOrderby() {
        return this.orderby;
    } 

    public int doStartTag() {
        try {
            this.connection = DAO.getConnection();
            String queryString = "";
            if(table.equalsIgnoreCase("city")) {
                queryString = "SELECT * FROM cities";    
            } else
                if(table.equalsIgnoreCase("student")) {
                    queryString = "SELECT * FROM students";
                } 
                if(!orderby.equalsIgnoreCase("")) {
                    queryString+ = " ORDER BY "+orderby; 
                } 
                this.preparedStatement = this.connection.prepareStatement(queryString);
                resultSet = preparedStatement.executeQuery();
                if(!resultSet.next()) return SKIP_BODY;
                setupData();
                return EVAL_BODY_INCLUDE;
        } catch(Exception exception) {
            exception.printStackTrace();
            return SKIP_BODY;
        } 
    } 

    public int doAfterBody() {
        try {
            if(!resultSet.next()) return SKIP_BODY;
            setupData();
        } catch(Exception exception) {
            exception.printStackTrace();
        } 
        return EVAL_BODY_AGAIN;
    } 

    public int doEndTag() {
        try {
            resultSet.close();
            preparedStatement.close();
            connection.close();
            reset();
        } catch(Exception exception) {
            exception.printStackTrace();
        } 
        return SKIP_BODY;
    } 

    public void setupData() {
        try {
            if(table.equalsIgnoreCase("city")) {
                CityBean cityBean = new CityBean();
                cityBean.setName(resultSet.getString("name").trim());
                cityBean.setCode(resultSet.getInt("code"));
                pageContext.setAttribute(name, cityBean, PageContext.SESSION_SCOPE);
                pageContext.setAttribute("index", index, PageContext.SESSION_SCOPE);
            } 
            else if(table.equalsIgnoreCase("student")) {
                StudentBean studentBean = new StudentBean();
                studentBean.setName(resultSet.getString("name").trim());
                studentBean.setRollNumber(resultSet.getInt("roll_number"));
                studentBean.setGender(resultSet.getString("gender"));
                studentBean.setIndian(resultSet.getString("indian"));
                studentBean.setAddress(resultSet.getString("address"));
                pageContext.setAttribute(name, studentBean, PageContext.SESSION_SCOPE);
                pageContext.setAttribute("index", index, PageContext.SESSION_SCOPE);
            } 
            ++index;
        } catch(Exception exception) {
            exception.printStackTrace();
        } 
    }  
} 