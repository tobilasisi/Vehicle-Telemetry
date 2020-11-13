USE fedex;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Alert;
TRUNCATE TABLE Driver;
TRUNCATE TABLE Maintenance;
TRUNCATE TABLE Route;
TRUNCATE TABLE Stop;
TRUNCATE TABLE Vehicle;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `fedex`.`Driver` (`firstname`, `lastname`, `address`, `phone`)
VALUES ('bob', 'smith', '1 front street', '555-555-5555');
INSERT INTO `fedex`.`Driver` (`firstname`, `lastname`, `address`, `phone`)
VALUES ('audrey', 'aldridge', '2 front street', '555-555-5556');
INSERT INTO `fedex`.`Driver` (`firstname`, `lastname`, `address`, `phone`)
VALUES ('cindy', 'bethel', '3 front street', '555-555-5557');

INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('ford', 'modelt', 1, 2000, 100000, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "idle", 10, 12, 1.2, 650.4, 33.4600, -88.8100, 5, "Station 1", 1, "gps,dashcam", 1, 1);
INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('honda', 'accord', 2, 1999, 87654, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "moving", 1000, 2000, 0.5, 700, 33.4610, -88.8100, 0, "Station 2", 1, "gps", 2, 2);
INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('utilimaster', 'reach', 3, 2014, 10, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "garage", 50, 100, 0.2, 900, 33.4600, -88.8110, 1, "Station 1", 0.5, "gps", 2, 2);
INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('utilimaster', 'reach', 4, 2010, 62758, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "moving", 200, 4, 0.5, 400, 33.4620, -88.8100, 2, "Station 1", 0.2, "gps,backupcam,dahscam", 1, 2);
INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('utilimaster', 'reach', 5, 2015, 45874, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "idle", 2, 2, 1.5, 999, 33.4600, -88.8120, 4, "Station 3", 10, "gps", 3, 1);
INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('reliant', 'robin', 6, 1980, 300000, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "garage", 15, 10, 4, 100, 33.4635, -88.8110, 8, "Station 2", 1, "gps,dashcam", 1, 2);
INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('horseand', 'buggy', 7, 1500, 500000, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "idle", 99, 86, 1, 965.2, 33.4517, -88.8111, 0, "Station 1", 0.75, "gps,ejectionseat", 3, 2);
        INSERT INTO `fedex`.`Vehicle` (`make`, `model`, `vin`, `startYear`, `mileCount`, imageUrl, `year`, `style`, `status`,
                               `todayPackages`, `yesterdayPackages`, yesterdayIdle, yesterdayMiles, `lat`, `lon`,
                               `yesterdayAlerts`, `station`, `averageIdle`, installedTechnology, `routeID`, `stationID`)
VALUES ('ford', 'modelt', 8, 2000, 100000, "https://static.turbosquid.com/Preview/001314/676/OC/_D.jpg", 2000, "LX",
        "idle", 10, 12, 1.2, 650.4, 33.4600, -88.8100, 5, "Station 3", 1, "gps,dashcam", 3, 3);


INSERT INTO `fedex`.`Alert` (`vehicleID`, `time`, `text`, `status`)
VALUES ((SELECT Vehicle.vehicleID FROM Vehicle where vin = 1), '2018-12-01 19:09:48', "Flat Tire", "active");

INSERT INTO `fedex`.`Alert` (`vehicleID`, `time`, `text`, `status`)
VALUES ((SELECT Vehicle.vehicleID FROM Vehicle where vin = 3), '2018-12-01 19:09:48', "Low Oil", "active");

INSERT INTO `fedex`.`Alert` (`vehicleID`, `time`, `text`, `status`)
VALUES ((SELECT Vehicle.vehicleID FROM Vehicle where vin = 4), '2018-12-01 19:09:48', "Engine Temperature", "active");


INSERT INTO `fedex`.`Maintenance` (`vehicleID`, `fixedTime`, `fixedByFirstname`, `fixedByLastname`, `mileage`, `text`)
VALUES ((SELECT Vehicle.vehicleID FROM Vehicle where vin = 1), '2018-12-01 19:10:14', 'bob', 'smith', 99998,
        "changed oil");


INSERT INTO `fedex`.`Route` (`departureTime`, `returnTime`, `courierID`, `vehicleID`,`totalMiles`, `totalIdleTime`)
VALUES ('2018-12-06 19:42:13',
        '2018-12-06 19:42:15',
        (SELECT Driver.courierID
         FROM Driver
         WHERE firstname = "bob"
           AND lastname = "smith"),
        (SELECT Vehicle.vehicleID FROM Vehicle where vin = 1), 22.3, 1512.6);

INSERT INTO `fedex`.`Route` (`departureTime`, `returnTime`, `courierID`, `vehicleID`,`totalMiles`, `totalIdleTime`)
VALUES ('2018-12-06 19:42:13',
        '2018-12-06 19:42:15',
        (SELECT Driver.courierID
         FROM Driver
         WHERE firstname = "audrey"
           AND lastname = "aldridge"),
        (SELECT Vehicle.vehicleID FROM Vehicle where vin = 2), 60.8, 1021.3);

INSERT INTO `fedex`.`Route` (`departureTime`, `returnTime`, `courierID`, `vehicleID`,`totalMiles`, `totalIdleTime`)
VALUES ('2018-12-06 19:42:13',
        '2018-12-06 19:42:15',
        (SELECT Driver.courierID
         FROM Driver
         WHERE firstname = "cindy"
           AND lastname = "bethel"),
        (SELECT Vehicle.vehicleID FROM Vehicle where vin = 3), 45, 985.6);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('942 South Shady Grove Road, Memphis, TN 38120', '2018-12-06', '2018-12-06 19:13:44', 35.10565,
        -89.85831389999998, (SELECT Route.routeID
                             FROM Route
                             WHERE Route.courierID = (SELECT courierID from Driver where firstname = "bob")
                             LIMIT 1), 1, 200);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('650 S Shady Grove Rd, Memphis, TN 38120', '2018-12-06', '2018-12-06 19:14:15', 35.1133524, -89.85818770000003,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "bob")
         LIMIT 1), 2, 412.3);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('6745 Wolf River Parkway, Memphis, TN 38120', '2018-12-06', '2018-12-06 19:14:15', 35.1188187, -89.838592,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "bob")
         LIMIT 1), 3, 60);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('1400 S Germantown Rd, Germantown, TN 38138', '2018-12-06', '2018-12-06 19:14:15', 35.1110704,
        -89.80085550000001, (SELECT Route.routeID
                             FROM Route
                             WHERE Route.courierID = (SELECT courierID from Driver where firstname = "bob")
                             LIMIT 1), 4, 45.3);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('1991 Exeter Rd, Germantown, TN 38138', '2018-12-06', '2018-12-06 19:14:15', 35.0945517, -89.80394969999998,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "bob")
         LIMIT 1), 6, 212.5);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('Poplar Ave & W Farmington Blvd, Germantown, TN 38138, USA', '2018-12-06', '2018-12-06 19:14:15', 35.0939842,
        -89.81130480000002, (SELECT Route.routeID
                             FROM Route
                             WHERE Route.courierID = (SELECT courierID from Driver where firstname = "bob")
                             LIMIT 1), 7, 315.2);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('3390 Woodridge Ln, Memphis, TN 38117', '2018-12-06', '2018-12-06 19:14:15', 35.1001734, -89.82459599999999,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "cindy")
         LIMIT 1), 1, 112.1);


INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('5865 US-72 #104, Memphis, TN 38119', '2018-12-06', '2018-12-06 19:14:15', 35.1020541, -89.86573390000001,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "cindy")
         LIMIT 1), 2, 100);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('5689 Quince Rd, Memphis, TN 38119', '2018-12-06', '2018-12-06 19:14:15', 35.0911624, -89.88299059999997,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "cindy")
         LIMIT 1), 3, 32.7);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('1576 S White Station Rd, Memphis, TN 38117', '2018-12-06', '2018-12-06 19:14:15', 35.0880611,
        -89.89036320000002, (SELECT Route.routeID
                             FROM Route
                             WHERE Route.courierID = (SELECT courierID from Driver where firstname = "cindy")
                             LIMIT 1), 4, 112.8);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('1770 Lanier Ln, Memphis, TN 38117', '2018-12-06', '2018-12-06 19:14:15', 35.0838064, -89.90432820000001,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "cindy")
         LIMIT 1), 5, 55.6);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('1000 Cherry Rd, Memphis, TN 38117', '2018-12-06', '2018-12-06 19:14:15', 35.1043829, -89.91400909999999,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "cindy")
         LIMIT 1), 6, 77.3);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('730 S Mendenhall Rd, Memphis, TN 38117', '2018-12-06', '2018-12-06 19:14:15', 35.1111239, -89.89543750000001,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "cindy")
         LIMIT 1), 7, 68.3);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('5259 Poplar Ave, Memphis, TN 38119', '2018-12-06', '2018-12-06 19:14:15', 35.1079261, -89.88666610000001,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
         LIMIT 1), 1, 85.5);


INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('5484 Summer Ave, Memphis, TN 38134', '2018-12-06', '2018-12-06 19:14:15', 35.1652721, -89.87867269999998,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
         LIMIT 1), 2, 99.9);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('6444 Raleigh Lagrange Rd, Memphis, TN 38134', '2018-12-06', '2018-12-06 19:14:15', 35.181454,
        -89.84332999999998, (SELECT Route.routeID
                             FROM Route
                             WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
                             LIMIT 1), 3, 86.3);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('6711 Bartlett Stage Cove, Bartlett, TN 38134', '2018-12-06', '2018-12-06 19:14:15', 35.2031139, -89.8672909,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
         LIMIT 1), 4, 12.5);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('5985 Stage Rd, Bartlett, TN 38134', '2018-12-06', '2018-12-06 19:14:15', 35.2039353, -89.86328689999999,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
         LIMIT 1), 5, 45);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('5770 Tangle Oaks Dr, Memphis, TN 38134', '2018-12-06', '2018-12-06 19:14:15', 35.185516, -89.87181559999999,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
         LIMIT 1), 6, 115.7);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('2154 Meadow Glade Ln, Memphis, TN 38134', '2018-12-06', '2018-12-06 19:14:15', 35.1865397, -89.87748829999998,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
         LIMIT 1), 7, 112);

INSERT INTO `fedex`.`Stop` (`address`, `offtime`, `ontime`, `lat`, `lon`, `routeID`, `number`, `timeElapsed`)
VALUES ('c 1807, Bartlett Rd, Memphis, TN 38134', '2018-12-06', '2018-12-06 19:14:15', 35.1749259, -89.88387980000005,
        (SELECT Route.routeID
         FROM Route
         WHERE Route.courierID = (SELECT courierID from Driver where firstname = "audrey")
         LIMIT 1), 8, 315.3);
