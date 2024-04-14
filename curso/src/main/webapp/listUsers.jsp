<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
  <div>
    <h1>Users</h1>
    <table border=1>
        <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Type</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userEmail}</td>
                <td>${user.userName}</td>
                <td>${user.userType}</td>
            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>
