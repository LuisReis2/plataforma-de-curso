<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Lista de Aulas</title>
    <link rel="stylesheet" type="text/css" href="style/listUsers.css">
    <link rel="stylesheet" href="style/menu.css">
</head>
<body>

<header class="header">
    <div class="logo-container">
        <img src="logo.png" alt="Logo" class="logo">
    </div>
    <div class="profile-tab" onclick="toggleProfile()">
        <img src="perfil.png" alt="Perfil" class="profile-icon">
    </div>
</header>

<main class="main-content">
    <div>
        <h1>Lista de Aulas</h1>
        <c:choose>
            <c:when test="${empty aula}">
                <p>Não há aulas disponíveis.</p>
            </c:when>
            <c:otherwise>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Conteúdo</th>
                        <th>Curso Pertencente</th>
                        <th>Ações</th>
                    </tr>
                    <c:forEach var="aula" items="${aula}">
                        <tr>
                            <td>${aula.idAula}</td>
                            <td>${aula.titulo}</td>
                            <td>${aula.conteudo}</td>
                            <td>${aula.cursoPertencente}</td>
                            <td>
                                <form action="/delete-aula" method="post">
                                    <input type="hidden" id="idAula" name="idAula" value="${aula.idAula}">
                                    <button type="submit">Excluir</button>
                                </form>
                                <span> | </span>
                                <a href="updateAula.jsp?idAula=${aula.idAula}&cursoPertencente=${aula.cursoPertencente}">Atualizar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
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
        <c:if test="${User != null}">
            <p>Nome: ${User.userName}</p>
            <p>Email: ${User.userEmail}</p>
        </c:if>
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
