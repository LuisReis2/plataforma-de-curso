<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${aula.getTitleAula()}</title>
    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" type="text/css" href="style/View.css">
</head>
<body>
<header class="header">
    <link rel="shortcut icon" type="image/x-icon" href="./Images/icon.ico">
    <div class="logo-container">
        <img src="Images/logo.png" alt="Logo" class="logo">
    </div>
    <div class="profile-tab" onclick="toggleProfile()">
        <img src="Images/perfil.png" alt="Perfil" class="profile-icon">
    </div>
</header>
<a href="/find-aulas?id=${sessionScope.idCursoAtual}"><img src="Images/back.png" alt="voltar" class="profile-icon"></a>

<main class="main-content">
    <h1 class="aula-title">${aula.getTitleAula()}</h1>
    <iframe class="iframe" width="600" height="345" src="${aula.getContentAula()}"></iframe>
</main>
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
