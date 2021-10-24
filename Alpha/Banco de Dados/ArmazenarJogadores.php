<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $jogador = $_POST['jogador'];
    $genero = $_POST['genero'];
    
    $verificaJogador = mysqli_query($conexao, "SELECT Nome FROM `TabelaJogadores` WHERE Nome='$jogador'");
    
    if($verificaJogador->fetch_assoc() == 0){
        mysqli_free_result($verificaJogador);
        $consultaSQL = "INSERT INTO  `TabelaJogadores` (`ID`, `Nome`, `Genero`) VALUES (NULL, '$jogador', '$genero')";
        $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL.");
        ini_set ('default_charset', 'UTF8');
    }else{
        echo "Jogador ja existente: ";
        $resposta = mysqli_num_rows($verificaJogador);
        echo $resposta;
    }

    mysqli_close($conexao);
?>


