<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Cadastro de Usuário</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
  font-family: 'Roboto', sans-serif;
  background-color: rgb(255, 0, 221); /* Cor de fundo escura */
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
form {
  background: linear-gradient(to right, #6f0aad, #1badd1); /* Gradiente roxo */
  padding: 40px;
  border-radius: 10px;
  box-shadow: 0 0 20px rgb(255, 0, 221);
  width: 300px;
  position: relative;
  transition: background-color 0.3s;
}
h2 {
  text-align: center;
  color: #fff;
  margin-bottom: 30px;
  font-size: 24px;
}
label {
  color: #fff;
  display: block;
  margin-bottom: 10px;
  font-size: 14px;
  transition: transform 0.3s;
}
input[type="text"],
select {
  width: calc(100% - 20px);
  padding: 10px;
  margin-top: 5px;
  margin-bottom: 20px;
  border: none;
  border-radius: 5px;
  box-sizing: border-box;
  background-color:rgb(255, 0, 221);
  color: #333; /* Alterado para cor padrão */
  font-size: 14px;
}
.select-wrapper {
  position: relative;
  overflow: hidden;
}
.select-wrapper select {
  appearance: none;
  -webkit-appearance: none;
  width: 100%;
  padding: 10px;
  border: none;
  border-radius: 5px;
  background-color: rgb(255, 0, 221);
  color: #333; /* Alterado para cor padrão */
  font-size: 14px;
  cursor: pointer;
}
.select-arrow {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  pointer-events: none;
  color: #fff;
}
input[type="submit"] {
  background: linear-gradient(to right, #1badd1, #6f0aad); /* Gradiente rosa */
  color: #fff;
  padding: 12px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  width: 100%;
  font-size: 16px;
  transition: background-color 0.3s;
}
input[type="submit"]:hover {
  background: linear-gradient(to right, #6f0aad, #1badd1); /* Gradiente rosa */
}

/* Estilos adicionais para diferentes tipos de usuário */
.form-admin {
  background: linear-gradient(to right, #ff6347, #ffa500); /* Gradiente laranja */
}

.form-professor {
  background: linear-gradient(to right, #32cd32, #228b22); /* Gradiente verde */
}

.form-student {
  background: linear-gradient(to right, #6495ed, #4169e1); /* Gradiente azul */
}

/* Animação para destacar a label selecionada somente teste */
@keyframes highlight-label {
  0% { transform: scale(1); }
  50% { transform: scale(1.1); }
  100% { transform: scale(1); }
}
.highlight-label {
  animation: highlight-label 0.5s ease-in-out;
}
    </style>
</head>
<body>

<form action="/create-aula" id="aula-form" method="post">
    <h2>CRIE A AULA</h2>
    <label for="idAula">id da AULA</label>
    <input id="idAula" name="idAula" style="text-align: center;" type="text"  value="${param.idAula}" >

    <label for="aula-name">TITULO DA AULA</label>
    <input id="aula-name" name="aula-name" style="text-align: center;" type="text" value="${param.aula-name}" >

    <label for="aula-content">CONTEUDO DA AULA</label>
    <input id="aula-content" name="aula-content" style="text-align: center;" type="text" value="${param.aula-content}" >

    <label for="aula-fkid">ID DO CURSO ATRELADO: </label>
    <input id="aula-fkid" name="aula-fkid" style="text-align: center;" type="text" value="${param.aula-fkid}">

    <input type="submit" value="Cadastrar">
</form>
</body>
</html>