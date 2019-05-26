<?php
  header('Access-Control-Allow-Origin: *');

  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $nome = $_POST['nome'];
  $turma = $_POST['turma'];
    
  $consultaSQL = "UPDATE Aluno alu SET Turma=10 INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma' AND alu.Nome='$nome'";        
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');

  if ($conexao->query($consultaSQL) === TRUE){
    echo "Aluno Expluso.";
  }

  mysqli_close($conexao);
?>