<?php
  header('Access-Control-Allow-Origin: *');
  $UF = $_GET['UF'];
  
  $servidor = "";
  $usuario = "";
  $senha = "";
  $banco = "";

  $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $consultaSQL="SELECT Nome FROM Municipio WHERE Uf='$UF' ORDER BY Nome ASC";
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');

  while($dados=mysqli_fetch_array($resultado)){
    echo $dados['Nome'];
    echo "<br>";
  }

  mysqli_close($conexao);
?>