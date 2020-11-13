<?php
require("db_creds.php");

function run_query($query)
{
    global $dsn, $username, $password;

    $options = [
        PDO::ATTR_EMULATE_PREPARES => false, // turn off emulation mode for "real" prepared statements
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, //turn on errors in the form of exceptions
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, //make the default fetch be an associative array
    ];

    try {
        $pdo = new PDO($dsn, $username, $password, $options);
    } catch (Exception $e) {
        error_log($e->getMessage());
        die("Not connected: " . $e->getMessage()); //something a user can understand
    }
    try {
        $result = $pdo->query($query)->fetchAll();
    } catch (Exception $e) {
        error_log($e->getMessage());
        die("Invalid query: " . $e->getMessage()); //something a user can understand
    }
    return $result;
}

function get_whole_table($table)
{
    $query = "SELECT * FROM " . $table . " WHERE 1";
    return run_query($query);
}

function get_vehicle($id)
{

    $query = "SELECT * FROM Vehicle WHERE vehicleID=" . $id;
    $vehicle = run_query($query)[0];
    $vehicle["alerts"] = get_alerts_for_vehicle($vehicle["vehicleID"]);
    $vehicle["maintenance"] = get_maintenance_for_vehicle($vehicle["vehicleID"]);

    return $vehicle;
}

function haversineGreatCircleDistance(
    $latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 3959)
{
    //https://stackoverflow.com/questions/10053358/measuring-the-distance-between-two-coordinates-in-php
    // convert from degrees to radians
    $latFrom = deg2rad($latitudeFrom);
    $lonFrom = deg2rad($longitudeFrom);
    $latTo = deg2rad($latitudeTo);
    $lonTo = deg2rad($longitudeTo);

    $latDelta = $latTo - $latFrom;
    $lonDelta = $lonTo - $lonFrom;

    $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
            cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
    return $angle * $earthRadius;
}

function get_route($id)
{
    $query = "SELECT * FROM Route WHERE routeID=" . $id;
    $route = run_query($query)[0];
    $route["stops"] = get_stops_for_route($id);
    $courierQuery = "SELECT * FROM Driver where courierID=" . $route["courierID"];
    $route["courier"] = run_query($courierQuery)[0];
    $total_stop_time = 0;
    for ($i = 0; $i < count($route["stops"]) - 1; $i++) {
        $stop1 = $route["stops"][$i];
        $stop2 = $route["stops"][$i + 1];
        $route["stops"][$i]["distanceToNext"] = round(haversineGreatCircleDistance($stop1["lat"], $stop1["lon"], $stop2["lat"], $stop2["lon"]),3);
    }
    $route["stops"][count($route["stops"]) - 1]["distanceToNext"] = 0;
    foreach ($route["stops"] as $stop) {
        $total_stop_time += $stop["timeElapsed"];
    }
    $route["totalStopped"] = $total_stop_time;
    $route["averageStopped"] = round($total_stop_time / count($route["stops"]),3);
    return $route;
}

function get_alerts_for_vehicle($id)
{
    $query = "SELECT * FROM Alert WHERE vehicleID=" . $id;
    return run_query($query);
}

function get_maintenance_for_vehicle($id)
{
    $query = "SELECT * FROM Maintenance WHERE vehicleID=" . $id;
    return run_query($query);
}

function get_stops_for_route($id)
{
    $query = "SELECT * from Stop WHERE routeID=" . $id;
    return run_query($query);
}

function get_vehicles($order = "vin", $station = null, $route = null)
{
    $query = "SELECT * FROM Vehicle WHERE 1";
    if ($station != null) {
        $query = $query . " AND stationID=" . $station;
    }
    if ($route != null) {
        $query = $query . " AND routeID=" . $route;
    }
    $vehicles = run_query($query);


    foreach ($vehicles as &$vehicle) {
        $vehicle["alerts"] = get_alerts_for_vehicle($vehicle["vehicleID"]);
        $vehicle["maintenance"] = get_maintenance_for_vehicle($vehicle["vehicleID"]);
    }


    if ($order == "alerts") {
        usort($vehicles, function ($vehicle1, $vehicle2) {
            if (empty($vehicle1["alerts"]) != empty($vehicle2["alerts"])) {
                return empty($vehicle1["alerts"]) ? 1 : -1;
            } else {
                return $vehicle1["vin"] <=> $vehicle2["vin"];
            }
        });
    }


    return $vehicles;
}

function count_vehicles_in_field()
{
    $query = "SELECT COUNT(*) FROM Vehicle WHERE `status` != \"garage\"";
    return run_query($query)[0]["COUNT(*)"];
}

function vehicles_in_field()
{
    $query = "SELECT * FROM Vehicle WHERE `status` != \"garage\"";
    return run_query($query);
}

function count_idle_vehicles()
{
    $query = "SELECT COUNT(*) FROM Vehicle WHERE `status` = \"idle\"";
    return run_query($query)[0]["COUNT(*)"];
}

function idle_vehicles()
{
    $query = "SELECT * FROM Vehicle WHERE `status` = \"idle\"";
    return run_query($query);
}

function count_active_alerts()
{
    $query = "SELECT COUNT(*) FROM Alert WHERE `status` = \"active\"";
    return run_query($query)[0]["COUNT(*)"];
}

function active_alerts()
{
    $query = "SELECT * FROM Alert WHERE `status` = \"active\"";
    return run_query($query);
}

function count_today_packages()
{
    $query = "SELECT SUM(todayPackages) FROM Vehicle";
    return run_query($query)[0]["SUM(todayPackages)"];
}