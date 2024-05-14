<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Lista de Aulas</title>
    <link rel="stylesheet" type="text/css" href="style/aulas.css">
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
<main class="main-content">
    <div>
        <h1>Lista de Aulas</h1>
        <c:choose>
            <c:when test="${empty aula}">
                <p>Não há aulas disponíveis.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="aula" items="${aula}">
                    <div class="curso-container">
                        <p><strong>TÍTULO:</strong> ${aula.titleAula}</p>
                        <p><strong>CONTEÚDO:</strong> ${aula.contentAula}</p>
                        <p><strong>Curso Pertencente:</strong> ${aula.fkCurso}</p>
                        <form action="viewAula" method="get">
                            <input type="hidden" id="idAula" name="idAula" value="${aula.idAula}">
                            <button type="submit">Acessar</button>
                        </form>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
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
            <button type="submit">Logout</button>
        </form>
    </div>
</div>
<script src="scripts/sidebar.js"></script>
</body>
</html>
