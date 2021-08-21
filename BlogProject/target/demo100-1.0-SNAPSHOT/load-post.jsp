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
    <title> User Manage</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"
            integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2.min.css">
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
        <div class="panel-body" style="text-align: center">
            <c:forEach var="user" items="${postList}">
                <div  class=" product column">
                    <article style="margin-bottom: 5em">
                        <a class="imgover" href="#">
                            <img style="width: 546px; height: 410px" src="${user.img_path}" alt="image"/>
                        </a>
                        <div class="excerpt">
                            <h6 class="heading">${user.title}</h6>
                            <p>${user.img_dres} [&hellip;]</p>
                            <div class="clear">
                                <footer class="fl_right">

                                    <a href="read-more?id=${user.id}" style="margin-right: 5em; ">Read More <i
                                            class="fas fa-angle-right"></i></a>
                                </footer>
                                <ul class="nospace meta fl_left">
                                    <li><i class="fas fa-user"></i> <a href="#">By User ID: ${user.idUser} </a></li>
                                    <li><i class="fas fa-tag"></i> <a href="#">Tag Name</a></li>
                                    <li>Create at: ${user.createday} </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                </div>
            </c:forEach>
        </div>

    </div>
</div>
</body>



</html>