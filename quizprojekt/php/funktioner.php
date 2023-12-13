<?php
declare (strict_types=1);

//funktion för att koppla till databasen
function connectDB():PDO {
    static $db=null;

    if ($db===null) {
        // Koppla mot databasen
        $dsn = 'mysql:dbname=DB47493;host=localhost';
        $dbUser = '47493';
        $dbPassword = "kALLELENNy21kALLELENNy21";
        $db = new PDO($dsn, $dbUser, $dbPassword);
    }

    return $db;
}   
//en funktion för att skickaJSON
function skickaJSON($content): void {
    if (is_array($content) || is_object($content)) {
        $json = json_encode($content, JSON_PRETTY_PRINT + JSON_UNESCAPED_UNICODE);
        echo $json;
        exit;
    } else {
        $error = new stdClass();
        $error->error_message = "Invalid content type. Expected array or object.";
        $error->content = $content;
        $json = json_encode($error, JSON_PRETTY_PRINT + JSON_UNESCAPED_UNICODE);
        echo $json;
        exit;
    }
}

?>