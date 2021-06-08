
<!DOCTYPE html>
<html>
<head>
    <title>Registation Form </title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <link rel="stylesheet" href="css/register.css">
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>

</head>
<body>
<div class="container" style="margin-top: 6em;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Registation Form</h2>

            <%
                String registerMsg = (String) request.getSession().getAttribute("addMsg");
            %>
            <br>
            <h3><%=registerMsg%></h3>

        </div>
        <div class="panel-body">
            <form method="post" >
                <div class="form-group">
                    <label for="username">Username:</label>

                    <input required="true" type="text" class="form-control" id="username" name="username">
                </div> <div class="form-group">
                <label for="password">Password:</label>

                <input required="true" type="password" class="form-control" id="password" name="password">
            </div>
                <div class="form-group">
                    <label for="name">Name:</label>

                    <input required="true" type="text" class="form-control" id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input required="true" type="email" class="form-control" id="email" name="email">
                </div>
                <br><br>
                <div id="fake-captcha">
                    <div id="fake-checkbox"></div>
                    Are you really a human?
                </div>

                <br>



                <button class="btn btn-success">Register</button>
                <a style="color: white" href="login-blog" class="btn btn-primary">Login Now!</a>

            </form>



        </div>
    </div>
</div>
<script>
    var captcha = document.getElementById("fake-captcha");

    var passOrFail = function() {
        var pass = Math.round(Math.random());
        return pass ? "pass" : "fail";
    }

    captcha.onclick = function() {
        if (captcha.className.includes("loading")) return;

        captcha.className = "";

        captcha.className += "loading";

        setTimeout(function() {
            captcha.className = captcha.className.replace("loading", "");
            captcha.className += passOrFail();
        }, Math.floor((Math.random() * 3000) + 1000));
    }

</script>

</body>

</html>