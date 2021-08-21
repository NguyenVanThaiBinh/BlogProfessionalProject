<%@ page import="com.model.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> User Manage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="../sweetalert/sweetalert2.js"></script>
    <link rel="stylesheet" href="../sweetalert/sweetalert2.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
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
<div class="container" id="content">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <%String msg = (String) request.getAttribute("msg"); %>
            <h2>
                <div class="header" style="text-align: center;">
                    <a href="#" style="margin-top: 3em;">User Management Binh Hu</a>
                </div>
            </h2>
            <br><br>
            </h3>
            <% request.setAttribute("msg", ""); %>
            <div style="display: flex; justify-content: center">
                <form method="get">
                    <div class="input-group">
                        <div class="form-outline">
                            <input type="hidden" name="action" value="search"/>
                            <input id="search-input" name="search" placeholder="Search anything..."
                                   type="search" id="form1" class="form-control"/>
                        </div>
                        <button id="search-button" style="height: fit-content; " type="submit" class="btn btn-primary">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
                <a style="float: right;margin-left: 6em;"
                   href="admin-blog" class="btn btn-outline-secondary">Back to home</a>
                <c:if test="${addMsg} != null">
                    <h1>${addMsg}</h1>
                </c:if>
                <button class="btn btn-danger" style="margin-left: 17em;font-size: 20px;"
                        onclick="getRegister()">Create Now ?
                </button>

            </div>


        </div>
        <br><br>
        <div class="panel-body" style="text-align: center">
            <table class="table table-bordered">
                <thead id="insert">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>User</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${accountList}">
                    <tr id="tr-${user.id}">

                        <td>${user.id}</td>

                        <td>${user.name}</td>

                        <td>${user.email}</td>

                        <td>${user.user}</td>
                        <td>
                            <button class="btn btn-primary" value="${user.id}" onclick="myFunction(this.value)">
                                Delete
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-primary" value="${user.id}" onclick="editUser(this.value)">
                                Edit
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
<script>
// Edit
function editUser(){

}
    class Product {
        constructor(username, email, password, name) {
            this.username = username;
            this.email = email;
            this.password = password;
            this.name = name;
        }
    }
    //    Dang Ky
    function getRegister() {
        Swal.fire({
            title: 'Submit to Register',
            html:
                '<input  type="text" class="swal2-input"placeholder="Username" id="username" name="username">' +
                '<input  type="password" class="swal2-input" placeholder="Password" id="password" name="password">' +
                '<input  type="text" class="swal2-input" placeholder="Name" id="name" name="name">' +
                '<input  type="email" class="swal2-input" placeholder="Email" id="email" name="email">',
            showCancelButton: true,
            confirmButtonText: 'Submit',
            focusConfirm: true,
            preConfirm: () => {
                const email = Swal.getPopup().querySelector('#email').value;
                const password = Swal.getPopup().querySelector('#password').value;
                const username = Swal.getPopup().querySelector('#username').value;
                const name = Swal.getPopup().querySelector('#name').value;
                if (!validateEmail(email)) {
                    Swal.showValidationMessage(`Mail is  NOT ok!`)


                }
                if (!checkPassword(password)) {

                    Swal.showValidationMessage(` Password is one number, one uppercase letter and least nine characters`)
                }
                if (name.length < 3 || username.length < 5) {
                    Swal.showValidationMessage(`That is so SHORT!`)
                }
                if (!username || !password || !email || !name) {
                    Swal.showValidationMessage(`Please enter all the fill!!!`)
                }
            }

        }).then(function () {
            let product = new Product(
                Swal.getPopup().querySelector('#username').value,
                Swal.getPopup().querySelector('#email').value,
                Swal.getPopup().querySelector('#password').value,
                Swal.getPopup().querySelector('#name').value
            );
            $.ajax({
                type: "post",
                url: "register-blog",
                data: product,
                success: function (result) {
                    console.log(result);
                    swal.fire(
                        "Done!",
                        "Welcome '" + product.name + "' to Binh Hu Blog!",
                        "success"
                    )
                    document.getElementById("insert").innerHTML += result;
                    // window.location.href = 'http://localhost:8089/user-manage';
                }
            });
        }).catch(swal.noop)
    }

    function checkPassword(str) {
        var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{9,}/;
        return re.test(str);
    }

    function validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    //Delete
    function myFunction(value) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({
                        type: "post",
                        url: "user-manage",
                        data: {'id': value},

                        success: function () {
                            swal.fire(
                                "Success!",
                                "Your note has been saved!",
                                "success"
                            )
                            console.log(value);
                            document.getElementById("tr-" + value).innerHTML = "";
                            console.log('Submission was successful!!!');
                        },
                        failure: function (response) {
                            swal.fire(
                                "Internal Error",
                                "Oops, your note was not saved.", // had a missing comma
                                "error"
                            )
                        }
                    });
                }
            },
        )
    }
    $("#mymsg").delay(2800).fadeOut(300);
</script>
</html>