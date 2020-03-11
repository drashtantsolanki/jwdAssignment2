<%-- 
    Document   : test
    Created on : Mar 9, 2020, 6:28:27 PM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="Emp.xml" var="emp"/>
        <x:parse xml="${emp}" var="pemp" />
        
        <form>
            Department :
            <select name="txtdept" onchange="this.form.submit()">
                <option value="-1">Select</option>
                <x:forEach var="i" select="$pemp/employees/employee">
                    <option><x:out select="department" /></option>
                </x:forEach>
            </select>
        </form>
        
        <hr/>
        <c:if test="${not empty param.txtdept}">
            <c:set var="i" value="${param.txtdept}" />
            <x:forEach var="j" select="$pemp/employees/employee">
                <x:if select="department = $i">
                    Employee:<x:out select="name" /><br>
                    Department:<x:out select="department" /><br>
                </x:if>
            </x:forEach>
        </c:if>
    </body>
</html>
