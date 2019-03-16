<?php
  header('Access-Control-Allow-Origin: *');
  $conexao = mysqli_connect("localhost","root","", "infanciasegura") or die("Erro 500. Falha ao se conectar.");
  mysqli_set_charset($conexao,"utf8");

  $consultaSQL="SELECT Uf FROM estado ORDER BY Uf ASC";
  $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
  ini_set ('default_charset', 'UTF8');

  while($dados=mysqli_fetch_array($resultado)){
    echo $dados['Uf'];
    echo "<br>";
  }

  mysqli_close($conexao);
?>