<?php
class DatabaseManager
{
    // DB connection data
    private $servername = "localhost";
    private $username = "root";
    private $password = "root";
    private $dbname = "gallery";
    private $port = 3306;
    private $conn;

    // Create connection
    public function __construct()
    {
        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname, $this->port);

        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }

    // Remove connection
    public function __destruct()
    {
        $this->conn->close();
    }

    // Send Query
    public function sendQuery($query)
    {
        return $this->conn->query($query);
    }
}
