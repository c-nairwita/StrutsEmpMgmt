
<!doctype html>
<html lang="en">
    <head>
        <title>Employee Management</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="theme-color" content="#712cf9">

        <!-- Custom styles for this template -->
        <link href="css/header.css" rel="stylesheet">
        <!--<link href="css/carousel.css" rel="stylesheet">-->
    </head>
    <header class="site-header sticky-top p-3 text-bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img src="images/Exavalu_Logo.png" width="100" height="50"></img>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="landingPage.jsp" class="nav-link px-2 text-secondary">Home</a></li>
                    <li><a href="addEmployee.jsp" class="nav-link px-2 text-white">Add</a></li>
                    <li><a href="searchEmployee.jsp" class="nav-link px-2 text-white">Search</a></li>
                    <li><a href="editEmployee.jsp" class="nav-link px-2 text-white">Update</a></li>
<!--                    <li><a class="nav-link px-2 text-white" href="#">
                            <c:if test="${not empty Users}">
                                Welcome: 
                                <c:out value = "${users.getFirstName()}"/>
                                <c:out value = "${users.getLastName()}"/>
                            </c:if>
                        </a>
                    </li>-->
                </ul>

                <div class="text-end">
                    <% if (request.getSession().getAttribute("Loggedin") == null) {%>

                    <a href="login.jsp">
                        <button type="button" class="btn btn-outline-light me-2" >Login</button>
                    </a>
                    <a href="signup.jsp">
                        <button type="button" class="btn btn-warning">Sign-up</button>
                    </a>
                    <%
                    } else {%>

                    <a href="Logout">
                        <button type="button" class="btn btn-outline-light me-2" >Log Out</button>
                    </a>
                    <%
                        }
                    %>


                </div>
            </div>
        </div>
    </header>