<?php
echo json_encode(array_map('basename', glob("../../assets/images/home/list/*")));
