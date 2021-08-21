<!DOCTYPE html>
<html>
<head>
    <title>Registation Form </title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="css/register.css">
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript"
            src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
    <style>
        div.error {
            color: #280606;
            font-size: 30px;
            text-shadow: 2px 7px 5px rgba(0,0,0,0.3),
            0px -4px 10px rgba(255,255,255,0.3);
        }
    </style>
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
            <h3><%=registerMsg%>
            </h3>

        </div>
        <div class="panel-body">
            <form method="post" id="formDemo">
                <div class="form-group">
                    <label for="username">Username:</label>

                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>

                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>

                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" name="email">
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
    <%--    validate--%>
    $(document).ready(function () {

        //Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
        $("#formDemo").validate({
            errorElement: 'div',
            rules: {
                password:{
                    required: true,
                    validatePassword: true,
                    minlength: 10
                },
                name: {
                    required: true,
                    minlength: 2
                },

                username: {
                    required: true,
                    minlength: 2,

                },
                email: {

                    required: true,
                    minlength: 2,
                    email: true
                }
            },
            messages: {
                name: "Input your name men!",
                username: "Input your name men!",
                email: {
                    required: "Vui lòng nhập địa chỉ",
                    minlength: "Are you crazy men???"
                }
            }
        });
        $.validator.addMethod("validatePassword", function (value, element) {
            return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
        }, "Please enter a password from 8 to 16 characters including uppercase, lowercase and at least one number");
    });


    <%--    recapcha--%>
    var captcha = document.getElementById("fake-captcha");

    var passOrFail = function () {
        var pass = Math.round(Math.random());
        return pass ? "pass" : "fail";
    }

    captcha.onclick = function () {
        if (captcha.className.includes("loading")) return;

        captcha.className = "";

        captcha.className += "loading";

        setTimeout(function () {
            captcha.className = captcha.className.replace("loading", "");
            captcha.className += passOrFail();
        }, Math.floor((Math.random() * 3000) + 1000));
    }

</script>

</body>

</html>