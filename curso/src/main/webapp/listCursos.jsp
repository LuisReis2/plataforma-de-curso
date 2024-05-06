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
        <img src="logo.png" alt="Logo" class="logo">
    </div>
    <div class="profile-tab" onclick="toggleProfile()">
        <img src="perfil.png" alt="Perfil" class="profile-icon">
    </div>
</header>

<div>
    <h1>Cursos</h1>
    <table border="1">
        <tr>
            <th>ID do Curso</th>
            <th>Nome do Curso</th>
            <th>Descrição</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="curso" items="${cursos}">
            <tr>
                <td>${curso.idCurso}</td>
                <td>${curso.nomeCurso}</td>
                <td>${curso.descCurso}</td>
                <td>
                    <form action="/delete-curso" method="post">
                        <input type="hidden" id="idCurso" name="idCurso" value="${curso.idCurso}">
                        <button class="action-button" type="submit">Delete</button>
                    </form>
                    <span> | </span>
                    <a class="action-link" href="editarCurso.jsp?idCurso=${curso.idCurso}&nomeCurso=${curso.nomeCurso}&descCurso=${curso.descCurso}">Update</a>
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
