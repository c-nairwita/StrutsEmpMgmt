
<!doctype html>
<html lang="en">
    <head>
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    <%@taglib prefix="s" uri="/struts-tags"%> 
    <body class="text-center" style="background-color: #FFF5EE">


        <main class="form-signin w-100 m-auto">
            <form action="Login" method="post">
                <img class="mb-4" src="images/Exavalu_Logo.png" alt="" width="150" height="57">
                <h1 class="h3 mb-3 fw-normal">Please Sign-in</h1>

                <!--                <h3 class="alert-danger">
                                    
                                </h3>-->

                <div class="form-floating">
                    <input name="emailAddress" type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" style="background-color: #8B0000; border: none" type="submit">Sign in</button>
            </form>
        </main>



    </body>
</html>
