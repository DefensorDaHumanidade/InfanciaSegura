<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $consultaSQL = "SELECT tur.Nome, tur.Senha, tur.Status FROM Turma tur WHERE tur.Status='aberto'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Nome'] . "<br>";
        echo $dados['Senha'] . "<br>";
        echo $dados['Status'] . "<br>";
    }

    mysqli_close($conexao);
?>