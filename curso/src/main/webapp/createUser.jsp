<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>

<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" href="style/createUser.css">
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
 <a href="menu.jsp"><img src="Images/back.png" alt="Perfil" class="profile-icon"></a>

<main>
 <c:if test="${sessionScope.UserLog.getUserType() eq 'ADM' || sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
    <form action="/create-user" id="user-form" method="post">
        <label for="name">Nome</label>
        <input id="name" name="name" type="text" value="${param.name}" required>

        <label for="email">Email</label>
        <input id="email" name="email" type="text" value="${param.email}" required>

        <label for="password">Senha</label>
        <input id="password" name="password" type="password" value="${param.password}" required>

        <label for="type">Tipo de Usuário</label>


<select id="type" name="type" required>
    <c:choose>
        <c:when test="${param.type eq 'ADM'}">
            <option value="ADM">Administrador</option>
            <option value="PROFESSOR">Professor</option>
            <option value="STUDENT">Aluno</option>
        </c:when>
        <c:when test="${param.type eq 'PROFESSOR'}">
            <option value="PROFESSOR">Professor</option>
            <option value="ADM">Administrador</option>
            <option value="STUDENT">Aluno</option>
        </c:when>
        <c:when test="${param.type eq 'STUDENT'}">
            <option value="STUDENT">Aluno</option>
            <option value="ADM">Administrador</option>
            <option value="PROFESSOR">Professor</option>
        </c:when>
        <c:otherwise>
            <option value="STUDENT">Aluno</option>
            <option value="ADM">Administrador</option>
            <option value="PROFESSOR">Professor</option>
        </c:otherwise>
    </c:choose>
</select>


        <input type="submit" value="Cadastrar">
    </form>
        </c:if>
          <c:if test="${sessionScope.UserLog.getUserType() eq 'STUDENT'}">
                    <h2>VOCÊ NÃO TEM PERMISSÃO A ISSO </h1>
                 </c:if>
</main>

<footer class="footer">
    <!-- Conteúdo do rodapé, se houver -->
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
