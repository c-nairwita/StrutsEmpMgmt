<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="com.exavalu.services.RoleService"%>
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
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <title>Add Employee Details</title>
    </head>
    <body class="text-center" style="background-color: #FFF5EE">

        <div class="container">
            <c:if test="${not empty SuccessMsg}">
                <h1 style="color: whitesmoke"><c:out value="${SuccessMsg}"/></h1>
                <c:remove var="SuccessMsg" scope="session"/>
                <% response.setHeader("Refresh", "3;url=employeeDetails.jsp");%>
            </c:if>
            <c:if test="${not empty ErrorMsg}">
                <h1 style="color: red"><c:out value="${ErrorMsg}"/></h1>
            </c:if>
        </div>

        <main class="form-control w-25 m-auto p-3">
            <div class="mb-3">
                <div class="card-header">

                    <h1 class="h3 mb-3 fw-normal text-center" style="color: #301934"><b>Add New Employee</b></h1>
                </div>
                <form action="AddEmployee" method="Post">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="First name" name="firstName" required autofocus>
                        <label for="floatingInput">First Name</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Last name" name="lastName" required>
                        <label for="floatingInput">Last Name</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Address" name="address" required>
                        <label for="floatingInput">Address</label>
                    </div>
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingInput" placeholder="Phone Number" name="phnumber" required>
                        <label for="floatingInput">Phone No</label>
                    </div>
                    <div class="form-floating">
                        <select name="gender" class="form-select" id="gender" required>
                            <option value="" hidden>Select Gender</option>
                            <option value="Male"> Male  </option>
                            <option value="Female"> Female  </option>
                        </select>
                    </div>
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingInput" placeholder="Age" name="age" required>
                        <label for="floatingInput">Age</label>
                    </div>
                    <div class="form-floating">
                        <select name="departmentId" class="form-select" id="departmentId" required>
                            <option value="" hidden>Select a Department</option>
                            <c:forEach var="dept" items="${DepartmentService.getAllDepartments()}">
                                <option value="${dept.getDepartmentId()}"> ${dept.getDepartmentName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-floating">
                        <select name="roleId" class="form-select" id="roleId" required>
                            <option value="" hidden> Select a Role</option>
                            <c:forEach var="role" items="${RoleService.getAllRoles()}">
                                <option value="${role.getRoleId()}"> ${role.getRoleName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" required>
                        <label for="floatingInput">Basic Salary</label>
                    </div>
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingInput" placeholder="carAllowance" name="carAllowance" required>
                        <label for="floatingInput">Car Allowance</label>
                    </div>
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingInput" placeholder="SpecialAllowance" name="specialAllowance" required>
                        <label for="floatingInput">Special Allowance</label>
                    </div>
                    <br>
                    <button class="w-50 btn btn-lg btn-primary" style="background-color: #301934; border: none" type="submit">Save</button>
                </form>
            </div>              
        </main>
    </body>
</html>