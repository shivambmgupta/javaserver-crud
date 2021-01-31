<%@page import = "java.net.* ,java.sql.*, javax.servlet.*, javax.servlet.http.*, java.io.*, com.thinking.machines.beans.*, com.thinking.machines.dao.*"%>
<jsp:useBean id = 'studentBean' scope = 'request' class = 'com.thinking.machines.beans.StudentBean'/>
<jsp:setProperty name = 'studentBean' property = '*'/>
<%
  try {
   StudentBean student = (StudentBean) request.getAttribute("studentBean");
   int rollNumber = studentBean.getRollNumber();
   String queryString = "DELETE FROM STUDENTS WHERE roll_number=?";
   Connection connection = DAO.getConnection();
   PreparedStatement preparedStatement = connection.prepareStatement(queryString);
   preparedStatement.setInt(1, rollNumber);
   preparedStatement.executeUpdate();
   } catch (Exception exception) {
     exception.printStackTrace();
   }
   MessageBean messageBean = new MessageBean("Record Deleted.");
   request.setAttribute("messageBean", messageBean);
%>
<jsp:include page = '/students.jsp'/>