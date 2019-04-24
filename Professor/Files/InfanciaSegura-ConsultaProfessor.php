<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $consultaSQL = "SELECT * FROM Professor WHERE Email='$email' AND Senha='$senha'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
    ini_set ('default_charset', 'UTF8');

    while($dados = mysqli_fetch_array($resultado)){
        echo $dados['Nome'] . "<br>";
        echo $dados['Email'] . "<br>";
        echo $dados['Senha'] . "<br>";
        echo $dados['Escola'] . "<br>";
        echo $dados['Cidade'] . "<br>";
        echo $dados['Estado'] . "<br>";
    }

    mysqli_close($conexao);
?>