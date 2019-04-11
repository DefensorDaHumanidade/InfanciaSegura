<?php
  header('Access-Control-Allow-Origin: *');

  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $nome = $_POST['nome'];
  $email = $_POST['email'];
  $NovoEmail = $_POST['novoemail'];
  $senha = $_POST['senha'];
  $escola = $_POST['escola'];
  $cidade = $_POST['cidade'];
  $estado = $_POST['estado'];
    
  $consultaSQL = "UPDATE Professor SET Nome='$nome', Email='$NovoEmail', Senha='$senha', Escola='$escola', Cidade='$cidade', Estado='$estado' WHERE Email='$email'";        
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');

  if ($conexao->query($consultaSQL) === TRUE){
    echo "Atualização bem sucedida.";
  }

  mysqli_close($conexao);
?>