<?php
require_once "funktioner.php";

// kolla anropnings metoden
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    $error = new stdClass();
    $error->meddelande = ["Fel metod", "Sidan ska anropas med POST"];
    skickaJSON($error, 405);
}

// anslut till databas
$db = connectDB();


// eämta JSON data från request
$postData = file_get_contents("php://input");
$requestData = json_decode($postData);


// extrahera ratt från JSON data
$ratt = strtolower(trim($requestData->ratt));

// SQL query
$sql = "SELECT DISTINCT q.id, q.ratt
        FROM question AS q
        JOIN options AS o ON q.id = o.id
        WHERE q.ratt = :ratt ";

$stmt = $db->prepare($sql);
$stmt->bindParam('ratt', $ratt, PDO::PARAM_STR);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    // om data är hittad
    $utskrift = 1;
    skickaJSON(['utskrift' => $utskrift]);
} else {
    //om data inte är hittad
    $utskrift = 0;
    skickaJSON(['utskrift' => $utskrift]);
}
?>
