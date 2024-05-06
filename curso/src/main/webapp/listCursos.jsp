<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Lista de Cursos</title>
    <link rel="stylesheet" type="text/css" href="style/listUsers.css">
    <link rel="stylesheet" href="style/menu.css">
</head>
<body>

<header class="header">
    <div class="logo-container">
        <img src="Images/logo.png" alt="Logo" class="logo">
    </div>
 


</header>

<div>
    <h1>Cursos</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descricao</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="curso" items="${cursos}">
            <tr>
                <td>${curso.getIdCurso()}</td>
                <td>${curso.getNomeCurso()}</td>
                <td>${curso.getDescCurso()}</td>
                <td>
                    <form action="/delete-curso" method="post">
                        <input type="hidden" name="id" value="${curso.getIdCurso()}">
                        <button type="submit">DELETE</button>
                        <span> | </span>
                        <a href="createCurso.jsp?idCurso=${curso.getIdCurso()}&nomeCurso=${curso.getNomeCurso()}&descCurso=${curso.getDescCurso()}">Update</a>
                    </form>
                    <form action="/find-aulas" method="post">
                        <input type="hidden" name="idCurso" value="${curso.getIdCurso()}">
                        <button type="submit">LISTA</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

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
