<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Post Form </title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <link rel="stylesheet" href="css/register.css">
    <link href="css/layout.css" rel="stylesheet" type="text/css" media="all"/>
    <link
            href="css/fontawesome-all.min.css"
            rel="stylesheet"
            type="text/css"
            media="all"
    />
    <link
            href="css/framework.css"
            rel="stylesheet"
            type="text/css"
            media="all"
    />

    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        @media screen and (max-width: 414px){
             article {
                 display: none !important;
             }
        }
    </style>

</head>
<body>
<div class="container" style="margin-top: 0em;">
    <%
        String msg = (String) request.getAttribute("msg");
    %>
    <div class="panel panel-primary">
        <div class="panel-heading" style="font-size: 25px;
    padding-bottom: 1em;">
            <h2 class="text-center" style="font-size: 39px;">Create Post</h2>

            <c:if test = "${msg != null}">
                <c:out value = "${msg}"/>
            </c:if>

        </div>
        <div class="panel-body">
            <form method="post" id="usrform">
                <div class="form-group">
                    <label for="title">Title:</label>

                    <input required="true" type="text" class="form-control" name="title" id="title">
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>

                    <input required="true" type="text" class="form-control" id="description" name="description">
                </div>
                <div class="form-group">
                    <label for="content">Content</label>
                    <textarea form="usrform" class="form-control" id="content" name="content" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <label for="img_path">Image Path:</label>
                    <input required="true" type="text" class="form-control" id="img_path" name="img_path">
                </div>
                <div class="form-group">
                    <label for="create_day">Create day:</label>
                    <input required="true" value="" type="text" class="form-control" id="create_day" name="create_day">
                </div>

                <br><br>


                <br>


                <button type="submit" id="submit" class="btn btn-success" style=" background-color: lightseagreen;">Create Now!</button>
                <button type="submit"  class="btn btn-success" style=" background-color: lightseagreen;visibility: hidden">Create Now!</button>

                <a style="color: white" href="user-blog" class="btn btn-primary">Back to page</a>

            </form>
            <br><br>

            <article id="article"  class="one_half first">
                <%
                String title = (String) request.getAttribute("title");
                String description = (String) request.getAttribute("description");
                String content = (String) request.getAttribute("content");
                String img_path = (String) request.getAttribute("img_path");
                %>
                <a class="imgover" href="#">
                    <c:if test = "${img_path == null}">
                        <img style="width: 446px; height: 310px"
                             src="resources/Login-Screen-Background-Wood-5.jpg"

                             alt="image">
                    </c:if></a>
                <c:if test = "${img_path != null}">
                    <img style="width: 446px; height: 310px"
                         src="<%=img_path%>"

                         alt="image">
                </c:if>

                <div class="excerpt">
                    <h6 id="result" class="heading">
                        <c:if test = "${title == null}">
                            This is title
                        </c:if>
                        <c:if test = "${title != null}">
                     <c:out value = "${title}"/>
                        </c:if>
                    </h6>
                    <p>
                        <c:if test = "${description == null}">
                            This is description, you can write here[&hellip;]
                        </c:if>
                        <c:if test = "${description != null}">
                            <c:out value = "${description}"/>
                        </c:if>
                    </p>
                    <div class="clear">

                        <ul class="nospace meta fl_left">

                            <li id="demo" ></li>
                        </ul>
                    </div>
                </div>
            </article>


        </div>
    </div>
</div>
<script>
    var dateObj = new Date();
    var month = dateObj.getUTCMonth() + 1; //months from 1-12
    var day = dateObj.getUTCDate();
    var year = dateObj.getUTCFullYear();

    newdate = day + "/" + month + "/" + year;
    document.getElementById("demo").innerHTML = "Create at: "+newdate;
    document.getElementById("create_day").value = newdate;
</script>


</body>

</html>