<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $professor = $_POST['professor'];
    $turma = $_POST['turma'];
    $senha = $_POST['senha'];
    $escola = $_POST['escola'];

    $consultaSQL = "SELECT prof.Id FROM Professor prof WHERE prof.Email='$professor'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    $Id = mysqli_fetch_array($resultado);

    echo $Id['Id'] . "<br>";

    $consultaSQL = "INSERT INTO Turma (Professor, Nome, Senha, Status, Escola) VALUES ($Id[0], '$turma', '$senha', 'aberto', '$escola')";
    ini_set ('default_charset', 'UTF8');

    if ($conexao->query($consultaSQL) === TRUE){
        echo "Turma adicionada";
      }

    mysqli_close($conexao);
?>