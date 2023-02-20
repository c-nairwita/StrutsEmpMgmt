<%@page import="com.exavalu.services.EmployeeService"%>
<%@page import="com.exavalu.models.Role"%>
<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="com.exavalu.models.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:set var="user" value='${request.getSession().getAttribute("User")}'/>
<c:if test='${user == null}'>
      ${request.getRequestDispatcher("login.jsp").forward(request, response)}
</c:if>--%>

<!doctype html>
<html lang="en">
    <head>        
        <title>Employee Management Web Application</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    </head>
    
    <body style="background-color: #FFF5EE">

        <jsp:include page="menu.jsp"></jsp:include>
        
        <div id="my-div"></div>

<!--            <h5>Select Number Of Rows:</h5>
            <div class="form-group">
                <select class  ="form-control" name="state" id="maxRows">
                    <option value="5000">Show ALL Rows</option>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="70">70</option>
                    <option value="100">100</option>
                </select>		 		
            </div>


            <table class="table table-hover table-bordered table-striped-columns text-center" id="table-id">
                <thead> 
                    <tr>
                        <th>
                            Employee Id
                        </th>
                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th>
                            Address
                        </th>
                        <th>
                            Phone
                        </th>
                        <th>
                            Gender
                        </th>
                        <th>
                            Age
                        </th>
                        <th>
                            Department Name  
                        </th>
                        <th>
                            Role Name  
                        </th>
                        <th>
                            Basic Salary
                        </th>
                        <th>
                            Car Allowance
                        </th>
                        <th>
                            Special Allowance
                        </th>
                        <th>
                            Action
                        </th>
                </thead>    
            </tr>

            <tbody>
            <c:forEach var="emp" items="${EmpList}">
                <tr>
                    <td>
                        ${emp.getEmployeeId()}
                    </td>
                    <td>
                        ${emp.getFirstName()}                    
                    </td>
                    <td>
                        ${emp.getLastName()}                    
                    </td>
                    <td>
                        ${emp.getAddress()}                    
                    </td>
                    <td>
                        ${emp.getPhnumber()}                    
                    </td>
                    <td>
                        ${emp.getGender()}                    
                    </td>
                    <td>
                        ${emp.getAge()}                    
                    </td>
                    <td>
                        ${emp.getDepartmentName()}                    
                    </td>
                    <td>
                        ${emp.getRoleName()}                    
                    </td>
                    <td>
                        ${emp.getBasicSalary()}                    
                    </td>
                    <td>
                        ${emp.getCarAllowance()}                    
                    </td>
                    <td>
                        ${emp.getSpecialAllowance()}                    
                    </td>
                    <td>
                        <a href="EditEmployee?employeeId=${emp.getEmployeeId()}">Edit</a>
                        <a href="DeleteEmployee?employeeId=${emp.getEmployeeId()}">Delete</a>
                    </td>
                </tr>

            </c:forEach>
        </tbody>
    </table>

    <%--<jsp:include page="pagination.jsp"></jsp:include>--%>

    <script src="pagination.js"></script>-->
</body>
</html>
