<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    $body = "Name: $name\nPhone: $phone\nEmail: $email\nMessage: $message";

    if (mail($email, "Curtain Gallery", $body)) {
        http_response_code(200);
        echo "Операция успешно выполнена";
    } else {
        http_response_code(500);
        echo "Ошибка при выполнении операции";
    }
}
