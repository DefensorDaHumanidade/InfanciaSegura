<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $nome = $_GET['nome'];
    $senha = $_GET['senha'];

    $consultaSQL = "SELECT Id FROM Aluno WHERE Nome='$nome' AND Senha='$senha'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    $dados = mysqli_fetch_array($resultado);
    echo $dados['Id'] . "<br>";
    
    $descricao = $_GET['descricao'];
    $local = $_GET['local'];
    $tipo = $_GET['tipo'];
    $ponto= $_GET['ponto'];

    $consultaSQL = "INSERT INTO `Desempenho` (`Id`, `Aluno`, `Tipo`, `Fase`, `Dificuldade`, `Descricao`, `Pontuacao`, `Visualizacao`, `UltimoJogo`) VALUES (NULL, '$dados[0]', '$tipo', '$local', '1', '$descricao', '$ponto', 'Visivel', '')";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    mysqli_close($conexao);
?>