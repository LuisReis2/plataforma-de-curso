<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>
<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Criando curso</title>
    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" type="text/css" href="style/createCurso.css">
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

<main>

<c:if test="${sessionScope.UserLog.getUserType() eq 'ADM' || sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
 <h2>Criando Curso</h2>
    <form id="cursoForm" action="/create-curso" method="post">
        <label for="idCurso">ID do curso</label>
        <input id="idCurso" name="idCurso" type="text" value="${param.idCurso}" >

        <label for="nomeCurso">Nome do curso</label>
        <input id="nomeCurso" name="nomeCurso" type="text" value="${param.nomeCurso}" >

        <label for="descCurso">Descrição do curso</label>
        <input id="descCurso" name="descCurso" type="text" value="${param.descCurso}" >
         <input type="hidden" name="update" value="${param.update}">
        <input type="submit" value="CRIAR">
    </form>
        </c:if>
        <c:if test="${sessionScope.UserLog.getUserType() eq 'STUDENT'}">
            <h2>VOCÊ NÃO TEM PERMISSÃO A ISSO </h1>
         </c:if>
    <div id="errorMessages"></div>
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
