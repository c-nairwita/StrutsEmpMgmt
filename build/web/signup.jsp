<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.104.2">
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <meta name="theme-color" content="#712cf9">


        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    <script>
        function valueFunc() {
            //location.href="PreSignUp";
            //document.getElementById("demo").innerHTML = document.getElementById("countryCode").value;
            signupForm.setAttribute("action","PreSignUp");
            signupForm.submit();
        }
    </script>

    <body class="text-center">


        <main class="form-signin w-100 m-auto">
            <form action="SignUp" method="post" id="signupForm">
                
                <img class="mb-4" src="images/flower-logo.jpg" alt="" width="200" height="200">
                <h1 class="h3 mb-3 fw-normal">Please provide below information</h1>

                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" name="emailAddress" placeholder="name@example.com" value ="${Users.getEmailAddress()}">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" value ="${Users.getPassword()}" >
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="first name" value ="${Users.getFirstName()}" >
                    <label for="firstName">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="last name" value ="${Users.getLastName()}" >
                    <label for="firstName">Last Name</label>
                </div>
                <div class="form-floating">
                    <select name="countryCode" class="form-select" id="countryCode" onchange="valueFunc()" required>
                        <option value="">Select a Country</option>
                        <c:forEach items="${CountryList}" var="country">
                            <option value=${country.getCountryCode()} <c:if test="${country.getCountryCode().equalsIgnoreCase(Users.getCountryCode())}"> selected </c:if>> ${country.getCountryName()}  </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-floating">
                    <select name="stateCode" class="form-select" id="stateCode" onchange="valueFunc()" required>
                        <option value="">Select a State</option>
                        <c:forEach items="${StateList}" var="province">
                            <option value=${province.getStateCode()} <c:if test="${province.getStateCode().equalsIgnoreCase(Users.getStateCode())}"> selected </c:if>> ${province.getStateName()}  </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-floating">
                    <select name="distCode" class="form-select" id="distCode" onchange="submitform()" required>
                        <option value="">Select a District</option>
                        <c:forEach items="${DistrictList}" var="district">
                            <option value=${district.getDistCode()} <c:if test="${district.getDistCode().equalsIgnoreCase(Users.getDistCode())}"> selected </c:if>> ${district.getDistName()}  </option>
                        </c:forEach>
                    </select>
                </div>


<!--                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>-->
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
                <a href="landingPage.jsp">
                    <button type="button" class="w-100 btn btn-lg btn-warning">Cancel</button>
                </a>
            </form>
<!--            <p id="demo"></p>-->
        </main>



    </body>
</html>
