<?php
require("db_access.php");

if (!debug_backtrace()) {
    header("content-type:application/json");
    $order = "vin";
    $station=null;
    $route=null;
    if (isset($_GET['order'])) {
        $order = $_GET["order"];
    }
    if (isset($_GET['station'])) {
        $station = $_GET["station"];
    }
    if (isset($_GET['route'])) {
        $route = $_GET["route"];
    }
    $vehicles = get_vehicles($order, $station, $route);
    echo json_encode($vehicles);
}
?>