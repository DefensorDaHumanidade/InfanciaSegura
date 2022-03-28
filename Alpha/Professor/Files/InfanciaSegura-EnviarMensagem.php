<?php

$mensagem = $_POST['mensagem'];

ini_set('display_errors', 1);
error_reporting(E_ALL);

$from = "educa.brasil.***@gmail.com";
$to = "educa.brasil.***@gmail.com";

$subject = "Mensagem enviada pela Ouvidoria";
$message = "$mensagem";
$headers = "De:". $from;

mail($to, $subject, $message, $headers);
echo "Mensagem enviada.";

?>