<%-- 
    Document   : Custom
    Created on : Mar 8, 2020, 7:55:10 PM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/CustomTag.tld" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1> Reverse String of "John Wick" <c:ReverseStr str="John wick" /></h1>
        <h1> Database Connection <c:databaseCon /></h1>
        <h1> Employees of Department Physics <c:EmtTag department="Physics"></c:EmtTag> </h1>
    </body>
</html>
