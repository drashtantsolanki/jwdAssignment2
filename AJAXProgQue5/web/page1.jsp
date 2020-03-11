<%-- 
    Document   : page1
    Created on : Mar 9, 2020, 7:14:01 PM
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
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/employeedb","root","root");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from tbldepartment");
        %>
        <form>
            Department:
            <select onchange="deptChange(this)">
                <option value="-1">Select Department</option>
                <% while (rs.next()) { %>
                <option value="<%= rs.getInt(1) %>"> <%= rs.getString(2) %> </option>  
                <% } %>
            </select>
            
            <div id="employee">
                Employee:
                <select>
                    <option value="-1">Employees</option>
                </select>
            </div>
                
        </form>
        
                <%} catch (Exception e) {
                    out.println(e);
                }
        %>
        
        
        
    </body>
</html>

<script type="text/javascript">
            function deptChange(d)
            {
                
                var req=new XMLHttpRequest();
                var url="page2.jsp?did="+d.value;
                try {
                    req.onreadystatechange=function()
                    {
                        if(req.readyState==4 && req.status==200)
                        {
                            var res=req.responseText;
                            document.getElementById("employee").innerHTML=res;
                            
                        }
                    }
                }catch(e)
                {
                    alert(e);
                }
                req.open("GET",url,true);
                req.send();
                
            }
</script>
