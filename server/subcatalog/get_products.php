<?php
require_once("../db/db_manager.php");
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $subcategory = intval($_GET['id']);

    $databaseManager = new DatabaseManager();

    $result = $databaseManager->sendQuery("SELECT p.id, p.name, p.image, p.price, p.is_exist
                                            FROM products AS p
                                            WHERE p.subcatalog_id = $subcategory");

    $result_i = $databaseManager->sendQuery("SELECT sc.name AS subcatalog_name, c.name AS catalog_name
                                            FROM subcatalog AS sc
                                            JOIN catalog AS c ON sc.catalog_id = c.id
                                            WHERE sc.id = $subcategory
                                            LIMIT 1");

    unset($databaseManager);

    if ($result->num_rows > 0 && $result_i->num_rows > 0) {
        $rows = $result->fetch_all(MYSQLI_ASSOC);
        $rows_i = $result_i->fetch_all(MYSQLI_ASSOC)[0];
        http_response_code(200);
        echo json_encode(["rows" => $rows, "rows_i" => $rows_i]);
    } elseif ($result->num_rows > 0) {
        $rows = $result->fetch_all(MYSQLI_ASSOC);
        http_response_code(200);
        echo json_encode(["rows" => $rows]);
    } elseif ($result_i->num_rows > 0) {
        $rows_i = $result_i->fetch_all(MYSQLI_ASSOC)[0];
        http_response_code(200);
        echo json_encode(["rows_i" => $rows_i]);
    } else {
        http_response_code(204);
        echo json_encode(["message" => "No records found"]);
    }
}
