<%@page import = "java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*, com.thinking.machines.beans.*, com.thinking.machines.dao.*" %>
<jsp:useBean id = 'studentBean' scope = 'request' class = 'com.thinking.machines.beans.StudentBean' />
<jsp:setProperty name = 'studentBean' property = '*' />
<%
	try {
		StudentBean student = (StudentBean) request.getAttribute("studentBean");
		Connection connection = DAO.getConnection();
		String queryString = "UPDATE students SET name=?, gender=?, address=?, indian=? WHERE roll_number=?";
		PreparedStatement preparedStatement = connection.prepareStatement(queryString);
		preparedStatement.setString(1, student.getName());
		preparedStatement.setInt(5, student.getRollNumber());
		preparedStatement.setString(2, student.getGender());
		preparedStatement.setString(3, student.getAddress());
		if (student.getIndian() == null)
 			preparedStatement.setString(4, "No");
		else
 			preparedStatement.setString(4, "Yes");
		preparedStatement.executeUpdate();
		MessageBean messageBean=new MessageBean("Record Updated.");
		request.setAttribute("messageBean", messageBean);
		} catch (Exception exception) {
 			MessageBean messageBean=new MessageBean("Error!");
  			request.setAttribute("messageBean", messageBean);
  			exception.printStackTrace();
		}
%>
<jsp:include page='/students.jsp' />