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
        <img src="logo.png" alt="Logo" class="logo">
    </div>
    <div class="profile-tab" onclick="toggleProfile()">
        <img src="perfil.png" alt="Perfil" class="profile-icon">
    </div>
</header>

<main class="main-content">
    <nav class="menu">
        <ul>
        <c:if test="${User.getUserType() eq 'ADM'}">
            <li><a href="/find-all-users">Lista de Users</a></li>
            <li><a href="/ListCursos">Lista de Cursos</a></li>
            <li><a href="createUser.jsp">Cadastrar User</a></li>
            <li><a href="createCurso.jsp">Criar Curso</a></li>
            <li><a href="testeAula.jsp">Criar Aulas</a></li>
        </c:if>
        </ul>
    </nav>
            <table border="1">
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Descrição</th>
                            <th>Actions</th>
                        </tr>
                       <c:forEach var="curso" items="${cursos}">
                           <tr>
                            <td>${curso.getIdCurso()}</td>
                               <td>${curso.getNomeCurso()}</td>
                               <td>${curso.getDescCurso()}</td>

                               <td>
                                <form action = "/delete-curso" method="post">
                                    <input type="hidden" id="id" name="id" value="${curso.getIdCurso()}">
                                    <button type="submit">DELETE</button>
                                    <span> | </span>
                                     <a href="createCurso.jsp?idCurso=${curso.getIdCurso()}&nomeCurso=${curso.getNomeCurso()}&descCurso=${curso.getDescCurso()}">Update</a>
                                </form>
                                <form action="/find-aulas" method="post">
                                    <input type="hidden" id="idCurso" name="idCurso" value="${curso.getIdCurso()}">
                                    <button type="submit">LISTA</button>
                                </form>
                           </tr>
                       </c:forEach>
                      <button type="button" onclick="redirectToHome()">Home</button>
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
        function redirectToHome() {
                window.location.href = "Authentication";
            }
</script>
</body>
</html>
