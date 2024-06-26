<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style/listas.css">
    <link rel="stylesheet" href="style/menu.css">
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
 <a href="/find-aulas?id=${sessionScope.idCursoAtual}"><img src="Images/back.png" alt="Perfil" class="profile-icon"></a>
<div class="table-container">
    <div>
        <h1>Lista de Participantes</h1>
        <table>
            <thead>
                <tr>
                    <th>ID Participante</th>
                    <th>ID do usuário participante</th>
                    <th>ID do curso pertencente</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="participante" items="${participantes}">
                    <tr>
                        <td>${participante.idParticipante}</td>
                        <td>${participante.idUserFk}</td>
                        <td>${participante.idCursoFk}</td>
                        <td class="action-buttons">
                            <form action="/delete-participante" method="post">
                                <input type="hidden" id="idCurso" name="idCurso" value="${participante.idCursoFk}">
                                <input type="hidden" id="idParticipante" name="idParticipante" value="${participante.idParticipante}">
                                <button type="submit">Excluir</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
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
            <button class="action-button logout-button" type="submit">Logout</button>
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
