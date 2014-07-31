$(document).ready(function(){
  $('#create_restaurant').hide();

  var geocoder;
  var map;
  function findCoords(address, rest_data){
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({'address': address}, function(results, status){
      if (status == google.maps.GeocoderStatus.OK){
        foundlat = results[0].geometry.location.k;
        foundlong = results[0].geometry.location.B;
        $("#new_restaurant_selection").
        append("<span data-lat='"+foundlat
        +"' data-long='"+foundlong+"'>"
        +rest_data['name']
        +" - "+rest_data['location']['display_address'][0]+", "+rest_data['location']['display_address'][2]+"</span></br>")
      }
    });
  };

  $('#restaurant_search').on('submit', function(e){
    e.preventDefault();

    $.get( "/yelp_call?name=" 
      + $('#name').val()+"&latitude=" 
      + $('#latitude').val()+"&longitude=" 
      + $('#longitude').val(), 
      function( response ) {
        $('#name').val('')
        for(var i =0;i<response.length;i++){
          if(response[i]['location']['coordinate'] != undefined){
              $("#new_restaurant_selection").
              append("<span data-lat='"+response[i]['location']['coordinate']['latitude']
                +"' data-long='"+response[i]['location']['coordinate']['longitude']+"'>"
                +response[i]['name']
                +" - "+response[i]['location']['display_address'][0]+", "+response[i]['location']['display_address'][2]+"</span></br>")            
          }else if (response[i]['location']['address'] != undefined){
            findCoords(response[i]['location']['display_address'][0]+", "+response[i]['location']['display_address'][2], response[i])
          }
        }
      }
    );
  });
});