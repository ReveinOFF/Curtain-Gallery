<?php
require_once("../db/db_manager.php");
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $databaseManager = new DatabaseManager();

    $result = $databaseManager->sendQuery("SELECT sc.id, sc.name, sc.image, c.name AS catalog_name
                                            FROM subcatalog AS sc
                                            JOIN catalog AS c ON sc.catalog_id = c.id");


    unset($databaseManager);

    if ($result) {
        if ($result->num_rows > 0) {
            $rows = $result->fetch_all(MYSQLI_ASSOC);
            http_response_code(200);
            echo json_encode($rows);
        } else {
            http_response_code(204);
            echo json_encode(["message" => "No records found"]);
        }
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Database error"]);
    }
}
