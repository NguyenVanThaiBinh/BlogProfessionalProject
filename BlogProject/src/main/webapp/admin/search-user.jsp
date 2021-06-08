<%@ page import="com.model.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
    Document   : add
    Created on : Aug 17, 2020, 8:22:48 PM
    Author     : Diep
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> Search Result Manage</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"
            integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        .header a {
            position: relative;
            display: inline-block;
            font-family: "Great Vibes", serif;
            font-size: 2.9vw;
            text-decoration: none;
            color: rgb(102, 153, 255);
        }

        .header a:hover::after {
            content: "";
            display: block;
            position: absolute;
            width: 100%;
            /* Adjust height and bottom values to work with selected font */
            height: .05em;
            bottom: .1em;
            /* Create gradient */
            background-image: linear-gradient(
                    to right,
                    transparent 0%,
                    rgba(102, 153, 255, .6) 30%,
                    rgba(102, 153, 255, .7) 50%,
                    rgba(102, 153, 255, .6) 70%,
                    transparent 100%
            );
            /* Set-up fade-in animation */
            opacity: 0;
            animation: fadeIn 400ms ease-out forwards;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            100% {
                opacity: 1;
            }
        }
    </style>

</head>
<body>

<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">



            <h2>
                <div class="header" style="text-align: center;">

                    <a href="#" style="margin-top: 3em;">User Management Binh Hu</a>
                </div>


            </h2>
            <br><br>






        </div>
        <br><br>
        <div class="panel-body" style="text-align: center">
            <table class="table table-bordered">
                <thead>

                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>User</th>


                    <th>Delete</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>

                        <td>${user.id}</td>

                        <td>${user.name}</td>

                        <td>${user.email}</td>

                        <td>${user.user}</td>




                        <td><a href="/user-manage?action=delete&id=${user.id}">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<br><a style="color: white;margin: 0 27em;" href="user-manage" class="btn btn-primary">Back to List</a>
</body>
<script>

    $("#mymsg").delay(2800).fadeOut(300);
</script>

</html>