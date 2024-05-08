<?php
// Include db_manager
require_once("../db/db_manager.php");

// Check for the GET value in the request
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    // Get id(INT) from GET data
    $subcategory = intval($_GET['id']);

    // Create DB connection
    $databaseManager = new DatabaseManager();

    // Run a query to retrieve sub-catalogs
    $result = $databaseManager->sendQuery("SELECT p.id, p.name, p.image, p.price, p.is_exist
                                            FROM products AS p
                                            WHERE p.subcatalog_id = $subcategory");

    // Run a query to get the path to the pages
    $result_i = $databaseManager->sendQuery("SELECT sc.name AS subcatalog_name, c.name AS catalog_name
                                            FROM subcatalog AS sc
                                            JOIN catalog AS c ON sc.catalog_id = c.id
                                            WHERE sc.id = $subcategory
                                            LIMIT 1");

    // Remove DB connection
    unset($databaseManager);

    // Return result
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
