<%@page import="com.thinking.machines.beans.*" %>
    <jsp:include page='/MasterPageTopSection.jsp' />
    <jsp:useBean id='messageBean' scope='request' class='com.thinking.machines.beans.MessageBean' />
    <jsp:include page='/StudentJS.jsp' />
    Add Student:&nbsp;<img src='/styleone/images/add.png' style='cursor: pointer;' onclick='return addStudent();'><br>
    PDF: <img src='/styleone/images/pdf.png' style='cursor: pointer;'>
    <br>
    <span id='statusSpan' style='float: right;'>
        <jsp:getProperty name='messageBean' property='message' />
    </span>
    <h3>Students</h3>
    <div style="overflow: scroll;max-height: 250px">
        <table border='1' id='student_table'>
            <thead>
                <tr>
                    <th>S.No.</th>
                    <th>Roll number</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Indian</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <jsp:include page='/MasterPageBottomSection.jsp' />