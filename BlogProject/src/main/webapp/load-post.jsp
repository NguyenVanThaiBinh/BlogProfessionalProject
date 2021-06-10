<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 6/9/2021
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Post List</title>
    <meta charset="utf-8"/>

    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />
    <script src="jquery-3.5.1.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="css/layout.css" rel="stylesheet" type="text/css" media="all"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
    <link
            href="css/framework.css"
            rel="stylesheet"
            type="text/css"
            media="all"
    />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link
            href="css/OverWrite.css"
            rel="stylesheet"
            type="text/css"
            media="all"
    />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .column {
            float: left;
            width: 50%;
        }
    </style>
</head>
<body>
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
</body>
</html>
