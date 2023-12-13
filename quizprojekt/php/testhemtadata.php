<?php
declare(strict_types=1);

try {
    // Skapa ett "handle" till Url för att läsa svaret från angiven sida
    $ch = curl_init('https://www.datanom.ax/~47493/quizprojekt/php/hemtadata.php    ');
    //returnera överföringen som en sträng
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    // Testa!
    testOK($ch);

} catch (Exception $e) {
    echo "<p class='error'>";
    echo "Något gick fel!<br>";
    echo $e->getMessage();
    echo "</p>";
} finally {
    // Stäng "handle" för att frigöra resurser
    curl_close($ch);
}

function testOK($curlHandle)
{
    // Anropar hämta alla och sparar svaret i en variabel
    $svarJSON = curl_exec($curlHandle);

    // GÖr om till objekt
    $svar = json_decode($svarJSON);
    if (is_array($svar)) { // Svaret är en array
        if (count($svar) > 0) { // Det finns rader
            echo "<p class='ok'>Hämta alla OK, " . count($svar) . " rader returnerades</p>";
        } else {
            echo "<p class='ok'>Hämta alla OK, inga rader fanns</p>";
        }
    } else {
        echo "<p class='error'>Hämta alla misslyckades</p>";
    }
}