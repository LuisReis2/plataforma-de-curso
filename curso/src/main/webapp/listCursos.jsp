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
    <link rel="stylesheet" type="text/css" href="style/aulas.css">
</head>
<body>

<header class="header">
    <div class="logo-container">
        <a href="menu.jsp"><img src="Images/logo.png" alt="Logo" class="logo"></a>
    </div>

    <div class="profile-tab" onclick="toggleProfile()">
        <img src="Images/perfil.png" alt="Perfil" class="profile-icon">
    </div>
</header>
<a href="menu.jsp"><img src="Images/back.png" alt="Voltar" class="profile-icon"></a>
<div class="title-container">
    <h1>Lista de Cursos</h1>
</div>
<div class="main-content">
    <c:forEach var="curso" items="${cursos}">
        <div class="curso-container">
            <input type="hidden" id="idCurso" name="idCurso" value="${curso.getIdCurso()}">
            <p><strong>Nome:</strong> ${curso.getNomeCurso()}</p>
            <p><strong>Descrição:</strong> ${curso.getDescCurso()}</p>

            <div class="divfoda">
                <button class="action-button" onclick="location.href='createCurso.jsp?idCurso=${curso.getIdCurso()}&nomeCurso=${curso.getNomeCurso()}&descCurso=${curso.getDescCurso()}'">Atualizar</button>
                <form action="/find-aulas" method="get">
                    <input type="hidden" name="id" value="${curso.getIdCurso()}">
                    <button class="action-button" type="submit">Acessar aulas</button>
                </form>
                <form action="/delete-curso" method="post">
                    <input type="hidden" name="id" value="${curso.getIdCurso()}">
                    <button class="action-button" type="submit">Deletar</button>
                </form>
            </div>
        </div>
    </c:forEach>
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
            <button class="action-button logout-button" type="submit">Logout</button>
        </form>
    </div>
</div>

<script src="scripts/sidebar.js"></script>

</body>
</html>

