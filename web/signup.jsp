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
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                        crossorigin="anonymous">
    </script>
    <script>
        function fetchContent(selectedId, targetId)
        {
            $.ajax({
                url: 'PreSignUp',
                data: {
                    [selectedId]: $("#" + selectedId).val()
                },
                success: function (responseText){
                    $("#" + targetId).html(responseText);
                }
            });
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
                    <select name="countryCode" class="form-select" id="countryCode" onchange="fetchContent('countryCode', 'stateCode')">
                        <option value="">Select a Country</option>
                        <c:forEach items="${CountryList}" var="country">
                            <option value=${country.getCountryCode()} <c:if test="${country.getCountryCode().equalsIgnoreCase(Users.getCountryCode())}"> selected </c:if>> ${country.getCountryName()}  </option>
                        </c:forEach>                       
                    </select>
                </div>
                <div class="form-floating">
                    <select name="stateCode" class="form-select" id="stateCode" onchange="fetchContent('stateCode', 'distCode')">
                        <option value="">Select a State</option>
                    </select>
                </div>
                <div class="form-floating">
                    <select name="distCode" class="form-select" id="distCode" onchange="submitform()" required>
                        <option value="">Select a District</option>
                    </select>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
                <a href="landingPage.jsp">
                    <button type="button" class="w-100 btn btn-lg btn-warning">Cancel</button>
                </a>
            </form>
        </main>



    </body>
</html>
