<?php
  header('Access-Control-Allow-Origin: *');

  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $turma = $_POST['turma'];
    
  $consultaSQL = "UPDATE Turma tur SET tur.Status='aberto' WHERE tur.Nome='$turma'";        
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');

  if ($conexao->query($consultaSQL) === TRUE){
    echo "Operacao Realizada.";
  }

  mysqli_close($conexao);
?>