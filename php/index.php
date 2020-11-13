<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

$app = new \Slim\App;

require_once("db_access.php");


$app->get('/vehicles', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $order = $request->getQueryParam("order");
    $station = $request->getQueryParam("station");
    $route = $request->getQueryParam("route");
    $vehicles = get_vehicles($order, $station, $route);

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/count_vehicles_in_field', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicles = count_vehicles_in_field();

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/vehicles_in_field', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicles = vehicles_in_field();

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/count_idle_vehicles', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicles = count_idle_vehicles();

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/idle_vehicles', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicles = idle_vehicles();

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/count_active_alerts', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicles = count_active_alerts();

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/active_alerts', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicles = active_alerts();

    $response = $response->withJson($vehicles);

    return $response;
});


$app->get('/count_today_packages', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicles = count_today_packages();

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/vehicle', function (Request $request, Response $response) {

    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicleID = $request->getQueryParam("id");
    $vehicle = get_vehicle($vehicleID);

    $response = $response->withJson($vehicle);

    return $response;
});


$app->get('/drivers', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $response = $response->withJson(get_whole_table("Driver"));

    return $response;
});

$app->get('/alerts', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $response = $response->withJson(get_whole_table("Alert"));

    return $response;
});

$app->get('/maintenances', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $response = $response->withJson(get_whole_table("Maintenance"));

    return $response;
});

$app->get('/routes', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $response = $response->withJson(get_whole_table("Route"));

    return $response;
});

$app->get('/route', function (Request $request, Response $response) {

    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $vehicleID = $request->getQueryParam("id");
    $vehicles = get_route($vehicleID);

    $response = $response->withJson($vehicles);

    return $response;
});

$app->get('/stops', function (Request $request, Response $response) {
    $response = $response->withHeader("content-type", "application/json");
    $response = $response->withHeader("Access-Control-Allow-Origin", "*");
    $response = $response->withJson(get_whole_table("Stop"));

    return $response;
});

$app->run();