<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">

    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style/listUsers.css">
</head>
<body>
  <div>
    <h1>Users</h1>
    <table border="1">
        <tr>
            <th>Nome</th>
            <th>Descrição</th>
            <th>ID</th>
        </tr>
       <c:forEach var="curso" items="${cursos}">
           <tr>
               <td>${curso.getNomeCurso()}</td>
               <td>${curso.getDescCurso()}</td>
               <td>${curso.getIdCurso()}</td>
           </tr>
       </c:forEach>
    </table>
  </div>
</body>
</html>
