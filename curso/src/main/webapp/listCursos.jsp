<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Lista de Cursos</title>
    <link rel="stylesheet" type="text/css" href="style/listUsers.css">
    <link rel="stylesheet" href="style/menu.css">
</head>
<body>

<header class="header">
    <div class="logo-container">
        <img src="Images/logo.png" alt="Logo" class="logo">
    </div>

     <div class="profile-tab" onclick="toggleProfile()">
                <img src="Images/perfil.png" alt="Perfil" class="profile-icon">
     </div>

</header>
 <a href="menu.jsp"><img src="Images/home.png" alt="Perfil" class="profile-icon"></a>
<div>
    <h1>Cursos</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descricao</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="curso" items="${cursos}">
            <tr>
                <td>${curso.getIdCurso()}</td>
                <td>${curso.getNomeCurso()}</td>
                <td>${curso.getDescCurso()}</td>
                <td>
                    <form action="/delete-curso" method="post">
                        <input type="hidden" name="id" value="${curso.getIdCurso()}">
                        <button type="submit">DELETE</button>
                        <span> | </span>
                        <a href="createCurso.jsp?idCurso=${curso.getIdCurso()}&nomeCurso=${curso.getNomeCurso()}&descCurso=${curso.getDescCurso()}">Update</a>
                    </form>
                    <form action="/find-aulas" method="post">
                        <input type="hidden" name="idCurso" value="${curso.getIdCurso()}">
                        <button type="submit">LISTA</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<footer class="footer">

</footer>

<div class="profile-sidebar" id="profileSidebar">
    <div class="profile-header">
        <h2>Meu Perfil</h2>
        <button class="close-btn" onclick="toggleProfile()">Fechar</button>
    </div>
    <div class="profile-body">
        <c:if test="${sessionScope.UserLog != null}">
                <p>Nome: ${sessionScope.UserLog.userName}</p>
                <p>Email: ${sessionScope.UserLog.userEmail}</p>
            </c:if>
             <form action="/logout" method="get">
                         <button type="submit">Logout</button>
                        </form>
    </div>
</div>

<script src="scripts/sidebar.js"></script>

</body>
</html>
