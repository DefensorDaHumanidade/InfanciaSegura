<?php
  header('Access-Control-Allow-Origin: *');

  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  if(isset($_POST['email'])){
    $email = $_POST['email'];

    $consultaSQL = "SELECT senha FROM Professor WHERE Email='$email'";     
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    if($dados=mysqli_fetch_array($resultado)){
      echo $dados['senha'];
    }else{
      echo "Email Invalido";
    }
  }
  mysqli_close($conexao);
?>