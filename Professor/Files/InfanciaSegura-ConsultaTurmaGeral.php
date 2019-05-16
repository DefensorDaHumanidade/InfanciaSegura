<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $turma = $_GET['turma'];

    $consultaSQL = "SELECT tur.Nome, tur.Senha, tur.Escola FROM Professor prof INNER JOIN Turma tur ON prof.Id=tur.Professor WHERE tur.Nome='$turma'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Nome'] . "<br>";
        echo $dados['Senha'] . "<br>";
        echo $dados['Escola'] . "<br>";
    }

    $consultaSQL = "SELECT count(alu.Nome) as quantidade FROM Aluno alu INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['quantidade'] . "<br>";
    }

    $consultaSQL = "SELECT alu.Nome FROM Aluno alu INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Nome'] . "<br>";
    }

    $consultaSQL = "SELECT Cadastro FROM Turma WHERE Nome='$turma'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Cadastro'] . "<br>";
    }

    $consultaSQL = "SELECT alu.Nome, alu.UltimoAcesso FROM Aluno alu INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma' ORDER BY alu.UltimoAcesso DESC";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    $dados = mysqli_fetch_array($resultado);
    echo $dados[0] . " - ";
    echo $dados[1] . "<br>";

    $consultaSQL = "SELECT count(desem.Tipo) as erros FROM Aluno alu INNER JOIN Desempenho desem ON desem.Aluno=alu.Id INNER JOIN Turma tur ON tur.Id=alu.Turma WHERE tur.Nome='$turma' AND desem.Tipo='Erro'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['erros'] . "<br>";
    }
    
    $consultaSQL = "SELECT tur.Status FROM Professor prof INNER JOIN Turma tur ON prof.Id=tur.Professor WHERE tur.Nome='$turma'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Status'] . "<br>";
    }

    mysqli_close($conexao);
?>