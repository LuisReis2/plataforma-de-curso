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
    <h1>Aula</h1>
    <table border="1">
        <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Type</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="aula" items="${aula}">
            <tr>
                <td>${aula.idAula}</td>
                <td>${aula.titleAula}</td>
                <td>${user.contentAula}</td>
                <td>${user.FkCurso}</td>
            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>
