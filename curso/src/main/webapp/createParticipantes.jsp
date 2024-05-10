<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <img src="Images/logo.png" alt="Logo" class="logo">
    </div>
     <div class="profile-tab" onclick="toggleProfile()">
            <img src="Images/perfil.png" alt="Perfil" class="profile-icon">
     </div>

</header>

<main>
    <h2>ADICIONANDO PARTICIPANTES AO CURSO</h2>
    <form id="cursoForm" action="/create-participantes" method="post">
        <label for="idParticipante">ID PARTICIPANTE</label>
        <input id="idParticipante" name="idParticipante" type="text" value="${param.idParticipante}" >

        <label for="idUserFk">ID DO USUARIO</label>
        <input id="idUserFk" name="idUserFk" type="text" value="${param.idUserFk}" >

        <label for="idCursoFk">ID DO CURSO</label>
        <input id="idCursoFk" name="idCursoFk" type="text" value="${param.idCursoFk}" >

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
