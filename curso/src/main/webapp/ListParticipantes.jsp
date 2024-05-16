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
    <link rel="stylesheet" type="text/css" href="style/Listas.css">
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
<div>
    <h1>PARTICIPANTES</h1>
    <table border="1">
        <tr>
            <th>ID Participante</th>
            <th>ID DE USAURIO DO PARTICIPANTE</th>
            <th>ID DO CURSO CUJO USAURIO PERTENCE</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="participante" items="${participantes}">
            <tr>
                <td>${participante.idParticipante}</td>
                <td>${participante.idUserFk}</td>
                <td>${participante.idCursoFk}</td>
                <td>
                    <form action="/delete-participante" method="post">
                        <input type="hidden" id="idParticipante" name="idParticipante" value="${participante.idParticipante}">
                        <button type="submit">Excluir</button>
                    </form>
                    <form action="createParticipantes.jsp" method="get">
                        <input type="hidden" name="idParticipante" value="${participante.idParticipante}">
                        <input type="hidden" name="idUserFk" value="${participante.idUserFk}">
                        <input type="hidden" name="idCursoFk" value="${participante.idCursoFk}">
                        <button type="submit" class="action-button update-button">Atualizar</button>
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

<script>
    function toggleProfile() {
        var sidebar = document.getElementById("profileSidebar");
        if (sidebar.style.right === "-300px") {
            sidebar.style.right = "0";
        } else {
            sidebar.style.right = "-300px";
        }
    }
</script>
</body>
</html>
