<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $nome = $_POST['nome'];
    $senha = $_POST['senha'];
    $genero = $_POST['genero'];

    $consultaSQL = "UPDATE Aluno SET GeneroPersonagem='$genero' WHERE nome='$nome' AND senha='$senha'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    mysqli_close($conexao);
?>