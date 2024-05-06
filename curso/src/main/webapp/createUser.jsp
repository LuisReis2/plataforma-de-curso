<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" href="style/createUser.css">
</head>
<body>

<header class="header">
    <div class="logo-container">
        <img src="Images/logo.png" alt="Logo" class="logo">
    </div>
        <img src="Images/perfil.png" alt="Perfil" class="profile-icon">
</header>

<main>
    <form action="/create-user" id="user-form" method="post">
        <label for="user-name">Nome</label>
        <input id="user-name" name="user-name" type="text" value="${param.user-name}" required>

        <label for="email">Email</label>
        <input id="email" name="email" type="text" value="${param.email}" required>

        <label for="password">Senha</label>
        <input id="password" name="password" type="password" value="${param.password}" required>

        <label for="type">Tipo de Usuário</label>
        <select id="type" name="type" required>
            <option value="ADM">Administrador</option>
            <option value="PROFESSOR">Professor</option>
            <option value="STUDENT">Aluno</option>
        </select>

        <input type="submit" value="Cadastrar">
    </form>
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
        <!-- Conteúdo do perfil, se houver -->
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
