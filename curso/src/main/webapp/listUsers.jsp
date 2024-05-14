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

<div class="table-container">
    <div>
        <h1>Lista de Usuarios</h1>
        <table border="1">
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Type</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.userEmail}</td>
                    <td>${user.userName}</td>
                    <td>${user.userType}</td>
                    <td>
                        <form action="/delete" method="post">
                            <input type="hidden" id="userEmail" name="userEmail" value="${user.userEmail}">
                            <button class="action-button" type="submit">Delete</button>
                        </form>
                        <form action="createUser.jsp" method="get">
                            <input type="hidden" name="email" value="${user.getUserEmail()}">
                            <input type="hidden" name="name" value="${user.getUserName()}">
                            <input type="hidden" name="type" value="${user.getUserType()}">
                            <input type="hidden" name="password" value="${user.getUserPass()}">
                            <button class="action-button update-button" type="submit">Update</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
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
