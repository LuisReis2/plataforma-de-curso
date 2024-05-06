<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Cadastro de Aulas</title>
    <link rel="stylesheet" href="style/menu.css">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #E4D6FF;
            color: rgb(211, 255, 253);
        }

        h2 {
            text-align: center;
            color: #402D65;
            font-weight: bold;
            margin-top: 20px;
        }

        form {
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
            margin: 20px auto;
            transition: background-color 0.3s;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #402D65;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px;
            box-sizing: border-box;
            border: 1px solid #6D5A93;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: none;
            border-radius: 4px;
            background-color: #402D65;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #6D5A93;
        }
    </style>
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

<form action="/create-aula" id="aula-form" method="post">
    <h2>CADASTRE/ATUALIZE A AULA </h2>
    <label for="idAula">ID AULA:</label>
    <input id="idAula" name="idAula" type="text" required>

    <label for="aula-name">TÍTULO DA AULA:</label>
    <input id="aula-name" name="aula-name" type="text" required>

    <label for="aula-content">CONTEÚDO DA AULA:</label>
    <input id="aula-content" name="aula-content" type="text" required>

    <label for="fkCurso">ID DO CURSO ATRELADO:</label>
    <input id="fkCurso" name="fkCurso" type="text" required>

    <input type="submit" value="Cadastrar">
</form>

<footer class="footer">

</footer>

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
