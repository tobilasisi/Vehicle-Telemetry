DROP SCHEMA IF EXISTS fedex;
CREATE DATABASE IF NOT EXISTS fedex;
USE fedex;
CREATE TABLE IF NOT EXISTS Driver
(
  courierID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  firstname varchar(16),
  lastname  varchar(16),
  address   varchar(32),
  phone     varchar(15)
);
CREATE UNIQUE INDEX Driver_courierID_uindex
  ON Driver (courierID);
CREATE TABLE IF NOT EXISTS Vehicle
(
  vehicleID           int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  make                varchar(16),
  model               varchar(16),
  year                int,
  style               varchar(16),
  vin                 int,
  startYear           int,
  mileCount           int,
  todayPackages       int,
  yesterdayPackages   int,
  yesterdayMiles      float,
  yesterdayIdle       float,
  yesterdayAlerts     int,
  lat                 float,
  lon                 float,
  imageUrl            varchar(2083),
  status              varchar(10),
  station             varchar(10),
  averageIdle         float,
  installedTechnology varchar(128),
  routeID             int,
  stationID           int
);

CREATE UNIQUE INDEX Vehicle_vehicleID_uindex
  ON Vehicle (vehicleID);
CREATE UNIQUE INDEX Vehicle_vin_uindex
  ON Vehicle (vin);
CREATE TABLE IF NOT EXISTS Route
(
  routeID       int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  departureTime datetime,
  returnTime    datetime,
  courierID     int             NOT NULL,
  vehicleID     int             NOT NULL,
  totalMiles    float,
  totalIdleTime float,
  CONSTRAINT courierID FOREIGN KEY (courierID) REFERENCES fedex.Driver (courierID),
  CONSTRAINT vehicleID FOREIGN KEY (vehicleID) REFERENCES fedex.Vehicle (vehicleID)
);
CREATE UNIQUE INDEX Route_routeID_uindex
  ON Route (routeID);

CREATE TABLE IF NOT EXISTS Stop
(
  stopID      int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  address     varchar(100),
  offtime     date,
  ontime      datetime,
  lat         FLOAT,
  lon         FLOAT,
  routeID     int,
  number      int,
  timeElapsed float,
  CONSTRAINT routeID FOREIGN KEY (routeID) REFERENCES fedex.Route (routeID)
);
CREATE UNIQUE INDEX Stop_stopID_uindex
  on Stop (stopID);

CREATE TABLE IF NOT EXISTS Maintenance
(
  maintenanceID    int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  vehicleID        int             NOT NULL,
  fixedTime        datetime,
  fixedByFirstname varchar(16),
  fixedByLastname  varchar(16),
  mileage          int,
  text             varchar(100),
  CONSTRAINT maintenance_vehicleID FOREIGN KEY (vehicleID) REFERENCES fedex.Vehicle (vehicleID)
);
CREATE UNIQUE INDEX Maintenance_maintenanceID_uindex
  on Maintenance (maintenanceID);
CREATE TABLE IF NOT EXISTS Alert
(
  alertID   int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  vehicleID int             NOT NULL,
  time      datetime,
  text      varchar(256),
  status    varchar(10),
  CONSTRAINT alert_vehicleID FOREIGN KEY (vehicleID) REFERENCES fedex.Vehicle (vehicleID)

);
CREATE UNIQUE INDEX Alert_alertID_uindex
  on Alert (alertID);

