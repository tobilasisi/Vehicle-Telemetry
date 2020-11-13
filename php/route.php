<?php
require("db_access.php");

if (!debug_backtrace()) {
    header("content-type:application/json");
    $routeID = "";
    if (isset($_GET['id'])) {
        $routeID = $_GET["id"];
    }
    $route = get_route($routeID);
    echo json_encode($route);
}
?>