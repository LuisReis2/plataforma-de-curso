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

                    <li><a href="testeAula.jsp">Criar Aulas</a></li>
                    <li><a href="createParticipantes.jsp">Criar Participante</a></li>
                    <li><a href="/ListParticipantes">Listar Participante</a></li>
                </c:if>
                <c:if test="${sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
                    <li><a href="/ListCursos">Lista de Cursos</a></li>
                    <li><a href="createCurso.jsp">Criar Curso</a></li>
                    <li><a href="testeAula.jsp">Criar Aulas</a></li>
                </c:if>
            </ul>
        </nav>
    </c:if>

    <table border="1" class="course-table">
        <tr>
            <th>Nome do curso</th>
            <th>Descrição</th>
            <th>Acessar</th>
            <c:if test="${sessionScope.UserLog.getUserType() ne 'STUDENT'}">
                <th>Actions</th>
            </c:if>
        </tr>
        <c:forEach var="curso" items="${sessionScope.meusCursos}">
            <tr>
                <td>${curso.getNomeCurso()}</td>
                <td>${curso.getDescCurso()}</td>
                <td>
                    <form action="/find-aulas" method="get">
                        <input id="id" name="id" type="hidden" value="${curso.getIdCurso()}">
                        <button type="submit">Acessar</button>
                    </form>
                </td>
                <c:if test="${sessionScope.UserLog.getUserType() ne 'STUDENT'}">
                    <td>
                        <!-- Delete e update ocultos pro aluno -->
                        <button>Delete</button>
                        <button>Update</button>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
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
