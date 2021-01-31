package com.thinking.machines.servlets;
import java.net.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.thinking.machines.beans.*;
import com.thinking.machines.dao.*;

public class DelelteServelt extends HttpServlet {

    public void doGet(HttpServletRequest resquest, HttpServlet response) {
        StudentBean student = (StudentBean)request.getParameter(studentBean);
        int rollNumber = studentBean.getRollNumber();
        String queryString = "DELETE FROM STUDENTS WHERE roll_number = ?";
        Connection connection = dao.getConnection();
        PreaparedStatement preparedStatement = connection.prepareStatement(queryString);
        preparedStatement.setInt(1,rollNumber);
        preparedStatement.executeUpdate();
    }
    
}
