<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $turma = $_GET['turma'];
    $aluno = $_GET['aluno'];

    $consultaSQL = "SELECT alu.Id FROM Aluno alu INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma' AND alu.Nome='$aluno'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    $IdAluno = mysqli_fetch_array($resultado);

    $consultaSQL = "SELECT * FROM Desempenho WHERE Aluno='$IdAluno[0]'AND Tipo='Erro'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Fase'] . " (Dificuldade: ";
        echo $dados['Dificuldade'] . ") - Falha: ";
        echo $dados['Descricao'] . "<br>";
    }

    mysqli_close($conexao);
?>