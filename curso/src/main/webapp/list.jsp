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
    <h1>list</h1>
    <table border="1">
        <tr>
           <th>id</th>
            <th>TITULO</th>
            <th>CONTEUDO</th>
            <th>CURSO PERETECENTE</th>
        </tr>
        <c:forEach var="aula" items="${aula}">
            <tr>
                 <td>${aula.getIdAula()}</td>
                 <td>${aula.getTitleAula()}</td>
                 <td>${aula.getContentAula()}</td>
                 <td>${aula.getFkCurso()}</td>
                 <td>
                   <form action="/DeleteAula" method="post">
                    <input type="hidden" id="IdAula" name="IdAula" value="${aula.getIdAula()}">
                    <button type="submit">Delete</button>
                    </form>
                 </td>
            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>
