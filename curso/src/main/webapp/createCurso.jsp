<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Criando curso</title>
    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" type="text/css" href="style/createCurso.css">
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

<main>
    <h2>Criando Curso</h2>
    <form id="cursoForm" action="/create-curso" method="post" onsubmit="return validateCursoForm()">
        <label for="idCurso">ID do curso</label>
        <input id="idCurso" name="idCurso" type="text" value="${param.idCurso}" required>

        <label for="nomeCurso">Nome do curso</label>
        <input id="nomeCurso" name="nomeCurso" type="text" value="${param.nomeCurso}" required>

        <label for="descCurso">Descrição do curso</label>
        <input id="descCurso" name="descCurso" type="text" value="${param.descCurso}" required>

        <input type="submit" value="CRIAR">
    </form>
    <div id="errorMessages"></div>
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

    function validateCursoForm() {
        var idCurso = document.getElementById("idCurso").value;
        var nomeCurso = document.getElementById("nomeCurso").value;
        var descCurso = document.getElementById("descCurso").value;
        var errorMessages = document.getElementById("errorMessages");

        errorMessages.innerHTML = "";

        if (idCurso === "") {
            errorMessages.innerHTML += "<p class='error-message'>Por favor, preencha o ID do curso.</p>";
            return false;
        }

        if (nomeCurso === "") {
            errorMessages.innerHTML += "<p class='error-message'>Por favor, preencha o nome do curso.</p>";
            return false;
        }

        if (descCurso === "") {
            errorMessages.innerHTML += "<p class='error-message'>Por favor, preencha a descrição do curso.</p>";
            return false;
        }

        return true;
    }
</script>
</body>
</html>
