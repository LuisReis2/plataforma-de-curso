<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">

    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style/users.css">
</head>
<body>
  <div>
    <h1>Users</h1>
    <table border="1">
        <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Type</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userEmail}</td>
                <td>${user.userName}</td>
                <td>${user.userType}</td>
                <td>
                <form action="/delete" method="post">
                                <input type="hidden" id="userEmail" name="userEmail" value="${user.userEmail}">
                                <button type="submit">Delete</button>
                                </form>
                </td>
            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>
