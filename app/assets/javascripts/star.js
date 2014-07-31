$(document).ready(function(){
   $('.star_rating').raty({
    click: function(score, evt){
      var rating=score;
      $('#review_rating').val(rating);
    }
  });
});  
