<?php
  header('Access-Control-Allow-Origin: *');

  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $email = $_GET['email'];
  $tamanho = $_GET['tamanho'];
  $fonte = $_GET['fonte'];
  $estilo = $_GET['estilo'];
  $idioma = $_GET['idioma'];
    
  $consultaSQL = "UPDATE Professor SET TamanhoLetra='$tamanho', FonteLetra='$fonte ', EstiloLetra='$estilo', Idioma='$idioma' WHERE Email='$email'";;     
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');

  if ($conexao->query($consultaSQL) === TRUE){
    echo "Atualização bem sucedida.";
  }

  mysqli_close($conexao);
?>