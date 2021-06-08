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
    <title> User Post Check</title>
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
        .panel-body table{

            margin: auto;
            width: 50% !important;
        }

    </style>

</head>
<body>

<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <%String msg = (String) request.getAttribute("msg"); %>


            <h2>
                <div class="header" style="text-align: center;">

                    <a href="#" style="margin-top: 3em;">User Post Check Binh Hu</a>
                </div>


            </h2>
            <br><br>

            <c:if test = "${msg != null}">
            <h3 id="mymsg" style="top: 4.5em;color: #ab5797;position: fixed;"><%=msg%>
            </c:if>

            </h3>

            <% request.setAttribute("msg", ""); %>
            <div style="display: flex; justify-content: center">




                <a style="float: right;margin-left: 6em;"
                   href="user-blog" class="btn btn-outline-secondary">Back to home</a>

            </div>


        </div>
        <br><br>

        <div class="panel-body" style="text-align: center">
            <table class="table table-bordered">
                <thead>

                <tr>
                    <th>ID</th>
                    <th>Title</th>
                   
                    <th>Image Description</th>
                    <th>Create Day</th>

                    <th>Edit</th>
                    <th>Delete</th>
                    <th>Station</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userListPost}"  varStatus="loop">
                    <tr>

                        <td>${loop.index}</td>
                        <td>${user.title}</td>



                        <td>${user.img_dres}</td>

                        <td>${user.createday}</td>






                        <td><a href="/post-check?action=edit&id=${user.id}">Edit</a></td>
                        <td><a href="/post-check?action=delete&id=${user.id} " onclick="myFunction()">Delete</a></td>

                        <c:if test = "${user.status == 1}">
                            <td><a class="btn btn-outline-primary" href="#">Checked</a></td>
                        </c:if>
                        <c:if test = "${user.status == 0}">
                        <td><a class="btn btn-outline-danger" href="#">Not Checked</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
<script>
    function myFunction() {
        confirm("Are you sure?!");
    }
    $("#mymsg").delay(2800).fadeOut(300);
</script>

</html>