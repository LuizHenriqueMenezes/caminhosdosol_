<?php

$nome = $_POST['nm_usuario'];
$sobrenome =$_POST['sbnm_usuario'];
$email = $_POST['email_usuario'];
$senha = $_POST['senha_usuario'];

echo $nome."<br>";
echo $sobrenome."<br>";
echo $email."<br>";
echo $senha."<br>";

$conexao = new PDO('mysql:host=caminhosdosol.database.windows.net, dbname=Caminhos do Sol',
                   'Caminhos',
                   'Cachorrodoido12');

$stmt = $conexao->prepare(insert into usuario)