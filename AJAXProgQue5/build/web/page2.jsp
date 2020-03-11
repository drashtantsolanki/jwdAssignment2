<%-- 
    Document   : page2
    Created on : Mar 9, 2020, 8:38:38 PM
    Author     : hi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int did=Integer.parseInt(request.getParameter("did"));
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/employeedb","root","root");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from tblemployee where DeptId="+did);
                out.println("Employee:<select><option value='-1'>Employees</option>");
                while(rs.next())
                {
                    out.println("<option value='"+rs.getInt(1) +"'>"+rs.getString(2) +"</option>");
                }
                out.println("</select>");
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
