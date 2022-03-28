<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $turma = $_GET['turma'];

    $consultaSQL = "SELECT alu.Nome, COUNT(d.Tipo) as total FROM Aluno alu INNER JOIN Turma tur ON tur.Id=alu.Turma JOIN Desempenho d ON alu.Id=d.Aluno WHERE tur.Nome='$turma' AND d.Tipo!='Acerto' GROUP BY 1";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Nome'] . "<br>";
        echo $dados['total'] . "<br>";
    }

    $consultaSQL = "SELECT count(alu.Nome) as quantidade FROM Aluno alu INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    $quantidade = mysqli_fetch_array($resultado);

    echo $quantidade['quantidade'] . "<br>";

    $consultaSQL = "SELECT count(d.Tipo) as quantidade FROM Desempenho d, Aluno alu INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma' AND alu.Id=d.Aluno AND d.Tipo='Erro'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    $quantidade = mysqli_fetch_array($resultado);

    echo $quantidade['quantidade'] . "<br>";

    mysqli_close($conexao);
?>