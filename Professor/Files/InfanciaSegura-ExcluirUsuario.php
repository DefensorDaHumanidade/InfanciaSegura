<?php
  header('Access-Control-Allow-Origin: *');

  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $email = $_POST['email'];
    
  $consultaSQL = "UPDATE Professor SET Email=CONCAT('Excluido:', '$email') WHERE Email='$email'";        
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');

  if ($conexao->query($consultaSQL) === TRUE){
    echo "Exclusão bem sucedida.";
  }

  mysqli_close($conexao);
?>