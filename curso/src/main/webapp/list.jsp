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
    <h1>LISTA DE AULAS</h1>
    <table border="1">
        <tr>
           <th>id</th>
            <th>TITULO</th>
            <th>CONTEUDO</th>
            <th>CURSO PERETECENTE</th>
        </tr>
        <c:forEach var="aula" items="${aula}">
            <tr>
                 <td>${aula.idAula}</td>
                 <td>${aula.titleAula}</td>
                 <td>${aula.contentAula}</td>
                 <td>${aula.fkCurso}</td>
                 <td>
                   <form action="/DeleteAula" method="post">
                    <input type="hidden" id="IdAula" name="IdAula" value="${aula.idAula}">
                    <button type="submit">Delete</button>
                    <a href="testeAula.jsp?idAula=${aula.idAula}&fkCurso=${aula.fkCurso}">Update</a>
                    </form>
                 </td>
            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>
