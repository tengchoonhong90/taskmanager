// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//function to show one location only
function currentMap(lat, lng) {
  var myCoords = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    center: myCoords,
    zoom: 14
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  var marker = new google.maps.Marker({
    position: myCoords,
    map: map
  });
}

//function for updating location
function markMap() {
  var lat = document.getElementById('task_latitude').value;
  var lng = document.getElementById('task_longitude').value;
 
  // if not defined create default position
  if (!lat || !lng){
    lat=1.3521;
    lng=103.8198;
    document.getElementById('task_latitude').value = lat;
    document.getElementById('task_longitude').value = lng;
  }
  var myCoords = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    center: myCoords,
    zoom: 18
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  var marker = new google.maps.Marker({
    position: myCoords,
    map: map
  })

  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);

  // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); (pushes searchbox inside map)

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();
    
    if (places.length == 0) {
      return;
    }
    
    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        console.log("Returned place contains no geometry");
        return;
      }

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
    console.log(places)
  });

  //add click event for marker
  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
    refreshMarker();
    marker.addListener('drag', function() {
      latlng = marker.getPosition();
      newlat=(Math.round(latlng.lat()*1000000))/1000000;
      newlng=(Math.round(latlng.lng()*1000000))/1000000;
      document.getElementById('task_latitude').value = newlat;
      document.getElementById('task_longitude').value = newlng;
    });

    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
      map.panTo(marker.getPosition());   
    });
    
  });

  function placeMarker(location) {
    if ( marker ) {
      marker.setPosition(location);
    } else {
      marker = new google.maps.Marker({
        position: location,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
      });
    }
  }

  //refresh marker position and recenter map on marker
  function refreshMarker() {
    var lat = marker.getPosition().lat();
    var lng = marker.getPosition().lng();
    document.getElementById('task_latitude').value = lat;
    document.getElementById('task_longitude').value = lng;
    map.setCenter(marker.getPosition());
  }
}

// function for initializing new map with no markers
function newMap() {
  var lat = document.getElementById('task_latitude').value;
  var lng = document.getElementById('task_longitude').value;

  if (!lat || !lng){
    lat=1.3521;
    lng=103.8198;
    document.getElementById('task_latitude').value = lat;
    document.getElementById('task_longitude').value = lng;
  }
  var myCoords = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    center: myCoords,
    zoom: 11
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  var card = document.getElementById('pac-card');
  var input = document.getElementById('pac-input');

  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

  var autocomplete = new google.maps.places.Autocomplete(input);

  // Bind the map's bounds (viewport) property to the autocomplete object,
  // so that the autocomplete requests use the current map bounds for the
  // bounds option in the request.
  autocomplete.bindTo('bounds', map);

  // Set the data fields to return when the user selects a place.
  autocomplete.setFields(
      ['address_components', 'geometry', 'icon', 'name']);

  var marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(1.3521, 103.58),
    draggable: true
  });

  autocomplete.addListener('place_changed', function() {
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      // User entered the name of a Place that was not suggested and
      // pressed the Enter key, or the Place Details request failed.
      window.alert("No details available for input: '" + place.name + "'");
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);
    
    // when marker is dragged update input values
    marker.addListener('drag', function() {
      latlng = marker.getPosition();
      newlat=(Math.round(latlng.lat()*1000000))/1000000;
      newlng=(Math.round(latlng.lng()*1000000))/1000000;
      document.getElementById('task_latitude').value = newlat;
      document.getElementById('task_longitude').value = newlng;
    });
    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
      map.panTo(marker.getPosition());   
    });
    refreshMarker();
  });

  //add click event for marker
  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
    refreshMarker();   
  });

  function placeMarker(location) {
    if ( marker ) {
      marker.setPosition(location);
    } else {
      marker = new google.maps.Marker({
        position: location,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
      });
    }
    marker.addListener('drag', function() {
      latlng = marker.getPosition();
      newlat=(Math.round(latlng.lat()*1000000))/1000000;
      newlng=(Math.round(latlng.lng()*1000000))/1000000;
      document.getElementById('task_latitude').value = newlat;
      document.getElementById('task_longitude').value = newlng;
    });

    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
      map.panTo(marker.getPosition());   
    });
  }

  //refresh marker position and recenter map on marker
  function refreshMarker() {
    var lat = marker.getPosition().lat();
    var lng = marker.getPosition().lng();
    document.getElementById('task_latitude').value = lat;
    document.getElementById('task_longitude').value = lng;
    map.setCenter(marker.getPosition());
  }
}

//function to show all task to current user available on map
function showAll() {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap',
    };
                    
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map"), mapOptions);
    map.setTilt(45);
        
    var taskArray = gon.locations;
    var taskeeArray = gon.taskees;
    var current_user = gon.user;

    console.log(taskArray[0])
    console.log(taskeeArray[0])
        
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Loop through our array of markers & place each one on the map  
    for( let i = 0; i < taskArray.length; i++ ) {
      for( let j = 0; j < taskeeArray.length; j++ ) {
        if ( taskArray[i].id == taskeeArray[j].task_id && taskArray[i].user_id != current_user && taskArray[i].completed != true ) {
          var position = new google.maps.LatLng(taskArray[i].latitude, taskArray[i].longitude);
          bounds.extend(position);
          marker = new google.maps.Marker({
              position: position,
              map: map,
              title: taskArray[i].task_name
          });
        
          // Allow each marker to have an info window    
          google.maps.event.addListener(marker, 'click', (function(marker, i) {
              return function() {
                  infoWindow.setContent(`<div><h5>${taskArray[i].task_name}</h5><div>
                  <div>${taskArray[i].task_description}<div>
                  <div><a href="/taskees/${taskeeArray[j].id}">To Task</a></div>
                  `);
                  map.setCenter(marker.getPosition())
                  infoWindow.open(map, marker);
              }
          })(marker, i));

          // Automatically center the map fitting all markers on the screen
          map.fitBounds(bounds);
        }
      }
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(12);
        google.maps.event.removeListener(boundsListener);
    });
  
}