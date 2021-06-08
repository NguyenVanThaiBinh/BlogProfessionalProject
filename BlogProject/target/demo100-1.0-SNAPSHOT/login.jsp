<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Blog</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">


</head>
<body>
<div class="container" style="margin-top: 14em;">
    <% String msg = (String) request.getAttribute("addMsg");

    %>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Login to come Binh Hu Blog</h1>
            <br>
            <h3 style="color: #2486ef"><%=msg%>
            </h3>
            <br>


        </div>
        <div class="panel-body">
            <form method="post">
                <div class="form-group">
                    <label for="username">UserName:</label>

                    <input required="true" type="text" class="form-control" id="username" name="usernameLogin">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input required="true" type="password" class="form-control" id="password" name="passwordLogin">
                </div>


                <button class="btn btn-primary">Login</button>
                <a href="register-blog" class="text-primary" style="margin-left: 17em;
    font-size: 26px;">Register Now ?</a>
            </form>


        </div>
    </div>
</div>
</body>
</html>