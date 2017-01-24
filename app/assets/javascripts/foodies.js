/* global $, google */
function initializeMap(foodies) {
  console.log('initializeMapIndex', foodies);
  var mapProp = {
    center: new google.maps.LatLng(51.508742,-0.120850),
    zoom: 15,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map"), mapProp);
  var geocoder = new google.maps.Geocoder();
  var markers = [];
  var bounds = new google.maps.LatLngBounds();
  var infowindow = new google.maps.InfoWindow();
  posts.forEach(function(post) {
    geocoder.geocode({address: post.address}, function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
        marker.addListener('click', function() {
          infowindow.setContent(
            '<h2>' + post.text + '</h2>' +
            '<p>' + post.address + '</p>' +
            '<a href="/posts/' + post.id + '">View more</a>'
          );
          infowindow.open(map, marker);
        });
        markers.push(marker);
        for (var i = 0;i < markers.length; i++) {
          bounds.extend(markers[i].getPosition());
        }
        map.fitBounds(bounds);
      }
    });
  });
}