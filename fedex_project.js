function downloadUrl(url, callback) {
    var request = window.ActiveXObject ?
        new ActiveXObject('Microsoft.XMLHTTP') :
        new XMLHttpRequest;
    request.onreadystatechange = function () {
        if (request.readyState == 4) {
            request.onreadystatechange = function () {
            };
            callback(request, request.status);
        }
    };
    request.open('GET', url, true);
    request.send(null);
}

function createMarker(vehicle, map) {
    var position = {lat: vehicle["lat"], lng: vehicle["lon"]};
    markers.push(new google.maps.Marker({position: position, map: map}));
}


function plotRouteThroughMarkers(directionsDisplay, markers) {
    var start = markers[0].position;
    var end = markers[markers.length - 1].position;
    var waypoints = [];
    for (i = 1; i < markers.length - 1; i++) {
        waypoints.push({location: markers[i].position});
    }
    plotRoute(directionsDisplay, start, end, waypoints);
}

function plotRouteThroughStops(directionsDisplay, stops) {
    var start = {lat:stops[0]["lat"], lng:stops[0]["lon"]}
    var end = {lat:stops[stops.length-1]["lat"], lng:stops[stops.length-1]["lon"]}
    var waypoints = [];
    for (i = 1; i < stops.length - 1; i++) {
        waypoints.push({location:{lat:stops[i]["lat"], lng:stops[i]["lon"]}});
    }
    plotRoute(directionsDisplay, start, end, waypoints);
}

function plotRoute(directionsDisplay, origin, destination, waypoints) {
    console.log(waypoints);
    var request = {
        origin: origin,
        destination: destination,
        waypoints: waypoints,
        // Note that Javascript allows us to access the constant
        // using square brackets and a string value as its
        // "property."
        travelMode: google.maps.TravelMode["DRIVING"]
    };
    directionsService.route(request, function (response, status) {
        if (status == 'OK') {
            directionsDisplay.setDirections(response);
        }
    });


}

function constructVehicleTile(vehicle) {
    if (vehicle.alerts.length !== 0) {
        var overlayText = document.createTextNode("\t" + vehicle.alerts[0].text);
        var alertIcon = document.createElement("I");
        alertIcon.classList.add("material-icons", "alert-vis");

        if (vehicle.alerts[0].text === "low oil") {
            alertIcon.innerHTML = "opacity";
        } else if (vehicle.alerts[0].text === "flat tire") {
            alertIcon.innerHTML = "album";
        } else {
            alertIcon.innerHTML = "warning";
        }
    }
    var imageOverlay = document.createElement("DIV");
    imageOverlay.classList.add("img-overlay", "pre-scrollable");
    var imageNode = document.createElement("IMG");
    imageNode.setAttribute("src", vehicle.imageUrl);
    imageNode.classList.add("img-responsive");
    var imageDiv = document.createElement("DIV");
    imageDiv.classList.add("img-wrapper");
    imageDiv.appendChild(imageNode);
    if (vehicle.alerts.length !== 0) {
        imageDiv.appendChild(imageOverlay);
        imageOverlay.appendChild(alertIcon);
        imageOverlay.appendChild(overlayText);
    }


    var nameText = document.createTextNode(vehicle.vin);
    var nameNode = document.createElement("DIV");
    nameNode.classList.add("panel-heading");
    nameNode.appendChild(nameText);
    var infoText = document.createTextNode(vehicle.make + " " + vehicle.model + " " + vehicle.mileCount);
    var infoNode = document.createElement("DIV");
    infoNode.classList.add("panel-body");
    infoNode.appendChild(infoText);
    var panelNode = document.createElement("DIV");
    panelNode.classList.add("panel")
    if (vehicle.alerts.length === 0) {
        panelNode.classList.add("panel-default");
    } else {
        panelNode.classList.add("panel-alert");
    }
    panelNode.onclick = function () {
        window.location.href = 'vehicle.html?id=' + vehicle.vehicleID
    };
    panelNode.appendChild(nameNode);
    //panelNode.appendChild(infoNode);
    panelNode.append(imageDiv);
    var div = document.createElement("DIV");
    div.classList.add("col-xs-6", "col-sm-4", "col-lg-3", "vehicle-tile");
    div.appendChild(panelNode);
    return div
}