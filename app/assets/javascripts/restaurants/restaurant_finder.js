$(document).ready(function(){
  $('#create_restaurant').hide();

  $('#restaurant_search').on('submit', function(e){
    e.preventDefault();


    $.get( "/yelp_call?name=" + $('#name').val()+"&latitude=" + $('#latitude').val()+"&longitude=" + $('#longitude').val(), function( response ) {
      console.log(response);
      $('#name').val('')
    });
  });
});