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
    <h2>Criando Curso</h2>
    <form id="cursoForm" action="/create-curso" method="post">
        <label for="idCurso">ID do curso</label>
        <input id="idCurso" name="idCurso" type="text" value="${param.idCurso}" >

        <label for="nomeCurso">Nome do curso</label>
        <input id="nomeCurso" name="nomeCurso" type="text" value="${param.nomeCurso}" >

        <label for="descCurso">Descrição do curso</label>
        <input id="descCurso" name="descCurso" type="text" value="${param.descCurso}" >

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

<script src="scripts/sidebar.js"></script>

</body>
</html>
