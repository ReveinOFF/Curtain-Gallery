<?php
require_once("../db/db_manager.php");
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $products = $_GET['ids'];
    $idsArray = explode(',', $products);

    $databaseManager = new DatabaseManager();

    $idsString = implode(',', array_map('intval', $idsArray));
    $result = $databaseManager->sendQuery("SELECT p.*
                                            FROM products AS p
                                            WHERE p.id IN ($idsString)");

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
