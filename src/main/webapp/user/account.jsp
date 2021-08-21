<!DOCTYPE html>
<html lang="en">
<head>
    <title>Reset Pasword</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
String msg = (String) request.getAttribute("msg");
%>

<div class="container">
    <h2 style="margin-top: 4em">Reset Password    <div style="margin-left: 21em"><%=msg%>

    </div>      </h2>


    <form class="was-validated" method="post">
        <div class="form-group">
            <label for="last-pwd">Recently Password:</label>
            <input type="password" class="form-control" id="last-pwd" placeholder="Enter recently password" name="last-pwd" required>
            <div class="valid-feedback">Valid.</div>

        </div>
        <div class="form-group">
            <label for="pwd"> New Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter new password" name="pwd" required>
            <div class="valid-feedback">Valid.</div>

        </div>
        <div class="form-group">
            <label for="re-pwd"> Confirm Password:</label>
            <input type="password" class="form-control" id="re-pwd" placeholder="Confirm password" name="re-pwd" required>
            <div class="valid-feedback">Valid.</div>

        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" required> I agree with Binh Hu rules.
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Check this checkbox to continue.</div>
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Change Password</button>
        <a style="color: white" href="user-blog" class="btn btn-primary">Back to page</a>
    </form>
</div>

</body>
</html>
