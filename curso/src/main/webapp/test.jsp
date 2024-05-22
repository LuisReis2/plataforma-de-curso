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

    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style/listUsers.css">
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
  <div>
    <h1>Users</h1>
    <table border="1">
        <tr>
            <th>Nome</th>
            <th>Descrição</th>
            <th>ID</th>
        </tr>
       <c:forEach var="curso" items="${cursos}">
           <tr>
               <td>${curso.getNomeCurso()}</td>
               <td>${curso.getDescCurso()}</td>
               <td>${curso.getIdCurso()}</td>
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
            <button class="action-button logout-button" type="submit">Logout</button>
        </form>
    </div>
</div>

<script src="scripts/sidebar.js"></script>

</body>
</html>
