<?php
require("db_access.php");

if (!debug_backtrace()) {
    header("content-type:application/json");
    $vehicleID = "";
    if (isset($_GET['id'])) {
        $vehicleID = $_GET["id"];
    }
    $vehicle = get_vehicle($vehicleID);
    echo json_encode($vehicle);
}
?>