<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Criando curso</title>
</head>
<body>
<form action="/create-curso" method="post">
    <label for="idCurso" >ID do curso</label>
    <input id="idCurso" name="idCurso" type="text" value="${param.idCurso}">
    <label for="nomeCurso" >Nome do curso</label>
    <input id="nomeCurso" name="nomeCurso" type="text" value="${param.nomeCurso}">
    <label for="descCurso" >Descrição do curso</label>
    <input id="descCurso" name="descCurso" type="text" value="${param.descCurso}">
    <input type="submit" value="CRIAR">
</form>
</body>
</html>