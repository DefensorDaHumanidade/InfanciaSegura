<?php
  header('Access-Control-Allow-Origin: *');

  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $nome = $_POST['nome'];
  $email = $_POST['email'];
  $senha = $_POST['senha'];
  $escola = $_POST['escola'];
  $cidade = $_POST['cidade'];
  $estado = $_POST['estado'];

  $consultaSQL = "INSERT INTO Professor (`nome`, `email`, `senha`, `escola`, `cidade`, `estado`) VALUES ('$nome', '$email', '$senha', '$escola', '$cidade', '$estado')";     
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');


  mysqli_close($conexao);
?>