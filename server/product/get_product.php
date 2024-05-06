<?php
require_once("../db/db_manager.php");
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $product = $_GET['id'];

    $databaseManager = new DatabaseManager();

    $result = $databaseManager->sendQuery("SELECT p.*
                                            FROM products AS p
                                            WHERE p.id = $product
                                            LIMIT 1");

    $result_i = $databaseManager->sendQuery("SELECT sc.name AS subcatalog_name, c.name AS catalog_name, sc.id AS sc_id
                                            FROM products AS p
                                            JOIN subcatalog AS sc ON p.subcatalog_id = sc.id
                                            JOIN catalog AS c ON sc.catalog_id = c.id
                                            WHERE p.id = $product
                                            LIMIT 1");

    unset($databaseManager);

    if ($result && $result_i) {
        if ($result->num_rows > 0 && $result_i->num_rows > 0) {
            $rows = $result->fetch_all(MYSQLI_ASSOC)[0];
            $rows_i = $result_i->fetch_all(MYSQLI_ASSOC)[0];
            http_response_code(200);
            echo json_encode(array("rows_i" => $rows_i, "rows" => $rows));
        } else {
            http_response_code(204);
            echo json_encode(["message" => "No records found"]);
        }
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Database error"]);
    }
}
