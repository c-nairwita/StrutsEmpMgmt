<%-- 
    Document   : editEmployee
    Created on : 03-Feb-2023, 10:45:21 am
    Author     : Nairwita Chakraborty
--%>
<%@page import="com.exavalu.models.Role"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.models.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Edit Employee Details</title>     
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/signin.css" rel="stylesheet">  
        <!-- Custom styles for this template -->
    </head>
    <body style="background-color: #FFF5EE">
        <%--<jsp:include page="menu.jsp"></jsp:include>--%>
        <main class="form-signin w-100 m-auto">

            <c:set var="emp" value="${Emp}"/>
            <div class="form-control">
                <form action="SaveEmployee" method="Post">

                    <h1 class="h3 mb-3 fw-normal" style="text-align: center; color: #301934"><b>Edit Employee Data</b></h1>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Employee ID" name="employeeId" readonly value="${emp.employeeId}">
                        <label for="floatingInput">Employee ID</label>
                    </div>    

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="First Name" name="firstName" value ="${emp.getFirstName()}">
                        <label for="floatingInput">First Name</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" name="lastName" value="${emp.getLastName()}">
                        <label for="floatingInput">Last Name</label>
                    </div>

                    <div class="form-floating">
                        <select name="gender" class="form-select" id="gender">
                            <option value="" hidden>${emp.getGender()}</option>
                            <option value="Male"> Male  </option>
                            <option value="Female"> Female  </option>
                        </select>
                        <label for="floatingInput">Gender</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Address" name="address" value=${emp.getAddress()}>
                        <label for="floatingInput">Address</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Phone Number" name="phnumber" value=${emp.getPhnumber()}>
                        <label for="floatingInput">Phone Number</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Age" name="age" value=${emp.getAge()}>
                        <label for="floatingInput">Age</label>
                    </div>

                    <div class="form-floating">
                        <select name="departmentId" class="form-select" id="departmentId">
                            <option value="0">Select a Department</option>
                            <c:forEach items="${deptList}" var="dept">
                                <option value=${dept.getDepartmentId()} <c:if test="${dept.getDepartmentName().equalsIgnoreCase(emp.getDepartmentName())}"> selected </c:if>> ${dept.getDepartmentName()}  </option>
                            </c:forEach>
                        </select>
                        <label for="floatingInput">Department</label>
                    </div>

                    <div class="form-floating">
                        <select name="roleId" class="form-select" id="roleId">
                            <option value="0">Select a Role</option>
                            <c:forEach items="${roleList}" var="role">
                                <option value=${role.getRoleId()} <c:if test="${role.getRoleName().equalsIgnoreCase(emp.getRoleName())}"> selected </c:if>> ${role.getRoleName()}  </option>
                            </c:forEach>
                        </select>
                        <label for="floatingInput">Role</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Basic salary" name="basicSalary" value=${emp.getBasicSalary()}>
                        <label for="floatingInput">Basic Salary</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Car Allowance" name="carAllowance" value=${emp.getCarAllowance()}>
                        <label for="floatingInput">Car Allowance</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Special Allowance" name="specialAllowance" value=${emp.getSpecialAllowance()}>
                        <label for="floatingInput">Special Allowance</label>
                    </div>

                    <br>

                    <button class="w-100 btn btn-sm btn-primary" style="background-color: #301934; border: none" type="submit">Save</button>

                </form>
            </div>
        </main>
    </body>
</html>
