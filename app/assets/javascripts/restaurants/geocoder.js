var geocoder;
var map;
function findCoords(address){
  geocoder = new google.maps.Geocoder();
  geocoder.geocode({'address': address}, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      foundcoords = results[0].geometry.location;
      console.log("inside the geocode thing");
      return foundcoords;
    }
  });
  console.log("outside the geocode thing");
}