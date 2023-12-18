<?php
declare (strict_types=1);
require_once 'funktioner.php';

// Koppla mot databasen
$db = connectDB();

// Hämta alla poster från tabellen
$sql = "SELECT DISTINCT question.id, bild, fraga, val
FROM question
JOIN options ON options.id = question.id";  

$stmt = $db->query($sql);
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

$retur = [];
foreach ($rows as $post) {
    $retur[] = $post;
}

//gör så att php texten blir finare och lättare att läsa
header("Content-Type: application/json; charset=UTF-8");

skickaJSON($retur);
