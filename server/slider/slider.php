<?php
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    echo json_encode(array_map('basename', glob("../../assets/images/home/list/*")));
}
