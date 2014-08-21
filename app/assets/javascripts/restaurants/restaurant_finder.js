$(document).ready(function() {
  $newRestaurant = $('#new_restaurant_form');
  $restaurantSearchResults = $('#restaurant_search_results');

  $("#restaurant_search_results").on('click', 'tr.restaurant_choice', function() {
    $newRestaurant.find("#restaurant_name").val($(this).data('name'));
    $newRestaurant.find("#restaurant_latitude").val($(this).data('latitude'));
    $newRestaurant.find("#restaurant_longitude").val($(this).data('longitude'));
    $newRestaurant.find("#restaurant_category").val($(this).data('category'));
    $newRestaurant.find("#restaurant_yelp_url").val($(this).data('url'));
    $newRestaurant.find("#restaurant_address").val($(this).data('address'));
    $newRestaurant.find("#restaurant_image_url").val($(this).data('image_url'));
    $newRestaurant.submit();
  });

  $('#restaurant_search').on('submit', function(e) {
    e.preventDefault();
    $restaurantSearchResults.find('tr').remove();

    $.get( "/yelp_call?name="
      + $('#name').val()+"&latitude="
      + $('#latitude').val()+"&longitude="
      + $('#longitude').val(),
      function( response ) {
        $('#name').val('');
        $("#new_restaurant_form").show();
        for(var i = 0; i < response.length; i++) {
          normalizeLocationAndAppend(response[i]);
        }
      }
    );
  });


  function normalizeLocationAndAppend(restaurant) {
    var yelpLocation = restaurant['location'];
    var streetAddress = yelpLocation['display_address'][0];
    var yelp_id = restaurant['id']
    var location = {
      display_address: streetAddress
    };
    if (yelpLocation['coordinate']) {
      location['latitude'] = yelpLocation['coordinate']['latitude'];
      location['longitude'] = yelpLocation['coordinate']['longitude'];
      appendToTable(restaurant, location, yelp_id);
    } else {
      var locationComponents = getLocationComponents(yelpLocation);
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({address: streetAddress, componentRestrictions: locationComponents}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          location['latitude'] = results[0].geometry.location.lat();
          location['longitude'] = results[0].geometry.location.lng();
          appendToTable(restaurant, location, yelp_id);
        }
      });
    }
  }

  function appendToTable(restaurant, location, yelp_id) {
    var $tr = $('<tr class="restaurant_choice">');
    $tr.data('name', restaurant['name']);
    $tr.data('latitude', location['latitude']);
    $tr.data('longitude', location['longitude']);
    $tr.data('address', location['display_address']);
    $tr.data('category', restaurant['categories'][0][0]);
    $tr.data('url', restaurant['url']);
    $tr.data('image_url', yelp_id);
    $tr.append('<td class="restaurant-name">' + restaurant['name'] + '</td>');
    $tr.append('<td class="restaurant-address">' + location['display_address'] + '</td>');
    $restaurantSearchResults.find("tbody").append($tr);
  }

  // Get all available info from the yelp results and convert to info to pass to Google Geocoder
  function getLocationComponents(yelpLocation) {
    var components = {};
    if (yelpLocation["postal_code"]) {
      components["postalCode"] = yelpLocation["postal_code"];
    }
    if (yelpLocation["state_code"]) {
      components["administrativeArea"] = yelpLocation["state_code"];
    }
    if (yelpLocation["city"]) {
      components["locality"] = yelpLocation["city"];
    }
    return components;
  }
});