$(document).ready(function(){
  $('#create_restaurant').hide();

  $('#restaurant_search').on('submit', function(e){
    e.preventDefault();


    $.get( "/yelp_call?name=" 
      + $('#name').val()+"&latitude=" 
      + $('#latitude').val()+"&longitude=" 
      + $('#longitude').val(), 
      function( response ) {
        $('#name').val('')
        for(var i =0;i<response.length;i++){
          //This is going to be a huge pain because not all restaurants have coordinates!!!
          $("#new_restaurant_selection").
          append("<span data-lat='"+response[i]['location']['coordinate']['latitude']+"'>"+response[i]['name']
          +" - "+response[i]['location']['address'][0]+"</span>")
        }
      }
    );
  });
});