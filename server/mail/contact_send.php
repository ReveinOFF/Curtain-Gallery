<?php
// Check for the POST value in the request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get all POST data
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    // Create message for mail
    $body = "Name: $name\nPhone: $phone\nEmail: $email\nMessage: $message";

    // Send mail and check for delivery
    if (mail($email, "Curtain Gallery", $body)) {
        http_response_code(200);
        echo "Операция успешно выполнена";
    } else {
        http_response_code(500);
        echo "Ошибка при выполнении операции";
    }
}
