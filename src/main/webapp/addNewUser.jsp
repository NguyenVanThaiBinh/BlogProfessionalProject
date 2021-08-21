<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 6/11/2021
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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

            <%--<td><a href="--%>
            <%--    /user-manage?action=delete&id=${user.id}" onclick="myFunction()">Delete</a></td>--%>
    </tr>
</c:forEach>
</body>
</html>
