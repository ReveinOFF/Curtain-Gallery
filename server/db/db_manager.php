<?php
class DatabaseManager
{
    private $servername = "localhost";
    private $username = "root";
    private $password = "root";
    private $dbname = "gallery";
    private $port = 3306;
    private $conn;

    public function __construct()
    {
        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname, $this->port);

        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }

    public function __destruct()
    {
        $this->conn->close();
    }

    public function sendQuery($query)
    {
        return $this->conn->query($query);
    }
}
