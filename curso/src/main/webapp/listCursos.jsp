<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Lista de Cursos</title>

    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" type="text/css" href="style/Listas.css">
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
    <table class="list-cursos-table">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descrição</th>
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
                        <button class="action-button" type="submit">DELETE</button>
                    </form>
                    <form action="createCurso.jsp" method="get">
                        <input type="hidden" name="idCurso" value="${curso.getIdCurso()}">
                        <input type="hidden" name="nomeCurso" value="${curso.getNomeCurso()}">
                        <input type="hidden" name="descCurso" value="${curso.getDescCurso()}">
                        <button class="action-button" type="submit">UPDATE</button>
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
