<%-- 
    Document   : search
    Created on : 24-Jan-2023, 12:41:58 pm
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

//        document.querySelector('#my-form').addEventListener('submit', function (event) {
//            event.preventDefault(); // prevent the default form submission behavior
//
//            // send an HTTP request using Ajax
//            var xhr = new XMLHttpRequest();
//            xhr.open('GET', 'http://localhost:8080/StrutsEmpMgmt/SearchEmployee', true);
//            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//            xhr.onload = function () {
//                if (xhr.status === 200) {
//                    // update the page content with the response from the server
//                    document.querySelector('#table-id').innerHTML = xhr.responseText;
//                }
//            };
//            var formData = new FormData(document.querySelector('#my-form'));
//            xhr.send(new URLSearchParams(formData));
//        });

        $(document).ready(function() {
            $('#my-form').submit(function(e) {
                e.preventDefault(); // prevent the form from submitting normally

                $.ajax({
                    type: 'POST',
                    url: 'searchEmployee.jsp', // replace with the URL of your form processing script
                    data: $('#my-form').serialize(), // serialize the form data
                    success: function(data) {
                        alert(data);
                        $('#searchedEmp').html(data); 
                    }
                });
            });
        };
        );

    </script>-->
    <body class="text-center" style="background-color: #FFF5EE">
        <%--<jsp:include page="menu.jsp"></jsp:include>--%>
        <!--<main id="my-div">-->
        <div class="">
            <h2 class="card-title">Enter Details</h2>
            <br>
        </div>
        <form id="my-form" class="form-inline" action="SearchEmployee" method="get" >
            <div class="container" >
                <div class="row">
                    <div class="form-control col-sm">
                        <input class="form-control" type="text" placeholder="First Name" name="firstName">
                    </div>
                    <div class="form-control col-sm">
                        <input class="form-control" type="text" placeholder="Last Name" name="lastName">
                    </div>
                    <div class="form-control col-sm">
                        <select name="gender" class="form-select" id="gender">
                            <option value="" hidden>Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>
                    <div class="form-control col-sm" >
                        <select name="departmentName" class="form-select" id="departmentName">
                            <option value="" hidden>Department</option>
                            <c:forEach var="dept" items="${DepartmentService.getAllDepartments()}">
                                <option value="${dept.getDepartmentName()}"> ${dept.getDepartmentName()}  </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-control col-sm">
                        <select name="roleName" class="form-select" id="roleName">
                            <option value="" hidden>Role</option>
                            <c:forEach var="role" items="${RoleService.getAllRoles()}">
                                <option value="${role.getRoleName()}"> ${role.getRoleName()}  </option>
                            </c:forEach>
                        </select>
                    </div>                   
                    <div class="form-control col-sm">
                        <button type="submit" id="submit_button" style="background-color: #301934; border: none" class="form-control btn btn-primary mb-2">Search</button>
                    </div>
                </div>
            </div>
        </form>  
        <c:if test="${not empty EmpList}">
            <div class="table-responsive justify-content-between">
                <table id="table-id" class="table table-hover table-striped-columns table-bordered text-center">
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
                            <!--<th>Action</th>-->
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
                                <!-- <td>
                                    <a href="EditEmployee?employeeId=${emp.getEmployeeId()}">Edit</a>
                                    <a href="DeleteEmployee?employeeId=${emp.getEmployeeId()}">Delete</a>
                                </td>-->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        </main>
    </body>
</html>
