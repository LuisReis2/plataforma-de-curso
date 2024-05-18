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
    <style>
        .curso-container {
            text-align: center;
        }

        .divfoda {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .curso-container .action-button {
            margin: 5px; /
        }
    </style>
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
<div class="title-container">
    <h1>Lista de Aulas</h1>
</div>
<c:choose>
    <c:when test="${empty aula}">
        <p>Não há aulas disponíveis.</p>
    </c:when>
    <c:otherwise>
        <c:forEach var="aula" items="${aula}">
            <div class="curso-container">
                <input type="hidden" id="idAula" name="idAula" value="${aula.idAula}">
                <p><strong>Título:</strong> ${aula.titleAula}</p>
                <p><strong>Conteúdo:</strong> ${aula.contentAula}</p>
                <p><strong>Curso:</strong> ${aula.fkCurso}</p>

                <c:if test="${sessionScope.UserLog.getUserType() eq 'ADM' || sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
                    <div class="divfoda">
                        <form action="/deleteAula" method="post">
                            <input type="hidden" name="idAula" value="${aula.idAula}">
                            <button class="action-button" type="submit">Deletar</button>
                        </form>
                        <form action="testeAula.jsp" method="get">
                            <input type="hidden" name="idAula" value="${aula.idAula}">
                            <input type="hidden" name="fkCurso" value="${aula.fkCurso}">
                            <button class="action-button" type="submit">Atualizar</button>
                        </form>
                        <form action="viewAula" method="get">
                            <input type="hidden" id="idAula" name="idAula" value="${aula.idAula}">
                            <button class="action-button access-right" type="submit">Acessar</button>
                        </form>
                    </div>
                </c:if>

                <c:if test="${sessionScope.UserLog.getUserType() ne 'ADM' && sessionScope.UserLog.getUserType() ne 'PROFESSOR'}">
                    <div class="divfoda">
                        <form action="viewAula" method="get">
                            <input type="hidden" id="idAula" name="idAula" value="${aula.idAula}">
                            <button class="action-button" type="submit">Acessar</button>
                        </form>
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>

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
