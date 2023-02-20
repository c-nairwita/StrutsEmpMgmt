<%-- 
    Document   : showall
    Created on : 14-Feb-2023, 2:32:08 pm
    Author     : Nairwita Chakraborty
--%>

<%@page import="com.exavalu.models.Employee"%>
<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.exavalu.models.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Web</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <!--        <link href="css/product.css" rel="stylesheet">
                <link href="css/menu_css.css" rel="stylesheet">
                <link href="css/login.css" rel="stylesheet">-->
    </head>
<!--    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                        crossorigin="anonymous">
    </script>
    <script>

        document.querySelector('a').addEventListener('click', function (event) {
            event.preventDefault(); // prevent the default anchor behavior
            // send an HTTP request using Ajax
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'http://localhost:8080/StrutsEmpMgmt/EditEmployee?employeeId=?', true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // handle the response from the server
                }
            };
            xhr.send();
        });
    </script>-->
    <body class="text-center" style="background-color: #FFF5EE">
        <%--<jsp:include page="menu.jsp"></jsp:include>--%>
        <c:if test="${not empty EmpList}">
            <div class="table-responsive">
                <table class="table table-hover table-striped-columns table-bordered text-center">
                    <thead>
                        <tr>
                            <th>Employee Id</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Department</th>
                            <th>Role</th>
                            <th>Basic Salary</th>
                            <th>Car Allowance</th>
                            <th>Special Allowance</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="emp" items='${EmpList}'>
                            <tr>
                                <th>${emp.getEmployeeId()}</th>
                                <td>${emp.getFirstName()}</td>
                                <td>${emp.getLastName()}</td>
                                <td>${emp.getAddress()}</td>
                                <td>${emp.getPhnumber()}</td>
                                <td>${emp.getGender()}</td>
                                <td>${emp.getAge()}</td>
                                <td>${emp.getDepartmentName()}</td>
                                <td>${emp.getRoleName()}</td>
                                <td>${emp.getBasicSalary()}</td>
                                <td>${emp.getCarAllowance()}</td>
                                <td>${emp.getSpecialAllowance()}</td>
                                <td>
                                    <a href="EditEmployee?employeeId=${emp.getEmployeeId()}">Edit</a>
                                    <a href="DeleteEmployee?employeeId=${emp.getEmployeeId()}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>

</html>
