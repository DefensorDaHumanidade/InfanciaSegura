<?php

$email = $_POST['email'];
$senha = $_POST['senha'];

ini_set('display_errors', 1);
error_reporting(E_ALL);

$from = "educa.brasil.***@gmail.com";
$to = "$email";

$subject = "Envio da Senha";
$message = "Sua senha para acessar a aplicação Infância Segura é: '$senha'";
$headers = "De:". $from;

mail($to, $subject, $message, $headers);
echo "Mensagem enviada.";

?>