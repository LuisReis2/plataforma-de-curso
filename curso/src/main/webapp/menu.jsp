<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
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

<main class="main-content">
    <nav class="menu">
        <ul>
        <c:if test="${sessionScope.UserLog.getUserType() eq 'ADM'}">
            <li><a href="/find-all-users">Lista de Usuarios</a></li>
            <li><a href="createUser.jsp">Cadastrar Usuario</a></li>
            <li><a href="/ListCursos">Lista de Cursos</a></li>
            <li><a href="createCurso.jsp">Criar Curso</a></li>
            <li><a href="listAulas.jsp">Lista de Aulas</a></li>
            <li><a href="testeAula.jsp">Criar Aulas</a></li>
            <li><a href="createParticipantes.jsp">Criar Participante</a></li>
            <li><a href="/ListParticipantes">Listar Participante</a></li>
        </c:if>
        </ul>
    </nav>
    <c:if test="${sessionScope.UserLog.getUserType() eq 'STUDENT'}">
        <nav class="menu">
            <ul>
            <c:if test="${sessionScope.UserLog.getUserType() eq 'STUDENT'}">
                <li><a href="/ListCursos">TODOS OS CURSOS DO SITE</a></li>
                <li><a href="parti">Curso Participante</a></li>
            </c:if>
            </ul>
        </nav>
    </c:if>
        <nav class="menu">
            <ul>
             <c:if test="${sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
                <li><a href="/ListCursos">Lista de Cursos</a></li>
                <li><a href="createCurso.jsp">Criar Curso</a></li>
                <li><a href="testeAula.jsp">Criar Aulas</a></li>
               </c:if>
            </ul>
        </nav>

        <table border="1">
                            <tr>
                                <th>ID</th>
                                <th>Nome do curso</th>
                                <th>descricao</th>
                            </tr>
                          <c:forEach var="curso" items="${sessionScope.meusCursos}">
                                <tr>
                                    <td>${curso.getIdCurso()}</td>
                                    <td>${curso.getNomeCurso()}</td>
                                    <td>${curso.getDescCurso()}</td>
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
