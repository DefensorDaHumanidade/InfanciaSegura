<?php
    header("Access-Control-Allow-Origin: *");

    $servidor = "";
    $usuario = "";
    $senha = "";
    $banco = "";

    $conexao = new mysqli($servidor, $usuario, $senha, $banco) or die("Erro 500. Falha ao se conectar.");
    mysqli_set_charset($conexao,"utf8");

    $jogador = $_POST['jogador'];

    $consultaSQL = "SELECT jog.ID FROM `TabelaJogadores` jog WHERE jog.Nome='$jogador'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL do identificador do jogador.");
    ini_set ('default_charset', 'UTF8');

    $Idjogador = mysqli_fetch_array($resultado);
    
    $pergunta = $_POST['pergunta'];
    
    $consultaSQL = "SELECT gab.ID FROM `TabelaGabarito` gab WHERE gab.Gabarito='$pergunta'";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar a consulta SQL do identificador da pergunta.");
    ini_set ('default_charset', 'UTF8');
    
    $Idpergunta = mysqli_fetch_array($resultado);
 
    $veredito = $_POST['veredito'];    
    $TI = $_POST['TI'];
    $TF = $_POST['TF'];
    $resposta = $_POST['resposta'];    


    $consultaSQL = "INSERT INTO `TabelaRespostas` (`ID`, `IDjogador`, `IDpergunta`, `Veredito`, `TempoInicial`, `TempoFinal`, `Resposta`) VALUES (NULL, '$Idjogador[0]', '$Idpergunta[0]', '$veredito',  FROM_UNIXTIME('$TI'), current_timestamp(), '$resposta')";
    $resultado=mysqli_query($conexao, $consultaSQL) or die("Erro 404. Falha ao realizar o registro no SQL.");
    ini_set ('default_charset', 'UTF8');

    mysqli_close($conexao);
?>