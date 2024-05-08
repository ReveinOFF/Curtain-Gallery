<?php
// Include db_manager
require_once("../db/db_manager.php");

// Check for the GET value in the request
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    // Get id from GET data
    $product = $_GET['id'];

    // Create DB connection
    $databaseManager = new DatabaseManager();

    // Run a query to retrieve product
    $result = $databaseManager->sendQuery("SELECT p.*
                                            FROM products AS p
                                            WHERE p.id = $product
                                            LIMIT 1");

    // Run a query to get the path to the pages
    $result_i = $databaseManager->sendQuery("SELECT sc.name AS subcatalog_name, c.name AS catalog_name, sc.id AS sc_id
                                            FROM products AS p
                                            JOIN subcatalog AS sc ON p.subcatalog_id = sc.id
                                            JOIN catalog AS c ON sc.catalog_id = c.id
                                            WHERE p.id = $product
                                            LIMIT 1");

    // Remove DB connection
    unset($databaseManager);

    // Return result
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
