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
    <title>Menu</title>
    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" type="text/css" href="style/aulas.css">
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

<main class="main-content">
    <c:if test="${sessionScope.UserLog.getUserType() ne 'STUDENT'}">
        <nav class="menu">
            <ul>
                <c:if test="${sessionScope.UserLog.getUserType() eq 'ADM'}">
                    <li><a href="/find-all-users">Lista de Usuarios</a></li>
                    <li><a href="createUser.jsp">Cadastrar Usuario</a></li>
                    <li><a href="/ListCursos">Lista de Cursos</a></li>
                    <li><a href="createCurso.jsp">Criar Curso</a></li>
                </c:if>
                <c:if test="${sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
                    <li><a href="/ListCursos">Lista de Cursos</a></li>
                    <li><a href="createCurso.jsp">Criar Curso</a></li>
                </c:if>
            </ul>
        </nav>
    </c:if>

    <c:if test="${not empty sessionScope.meusCursos}">
        <div class="main-content-header">
            <h1>Lista de Cursos</h1>
        </div>
        <div class="curso-container">
            <c:forEach var="curso" items="${sessionScope.meusCursos}">
                <div class="curso">
                    <h2>${curso.getNomeCurso()}</h2>
                    <p>${curso.getDescCurso()}</p>
                    <form action="/find-aulas" method="get">
                        <input id="id" name="id" type="hidden" value="${curso.getIdCurso()}">
                        <button class="action-button" type="submit">Acessar</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </c:if>
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
