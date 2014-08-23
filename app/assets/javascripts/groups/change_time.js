$(function(){
  $("#groups").on("click", ".current-member-group .group-time", function(e){
    e.stopPropagation();
    $clickedTime = $(this)
    $(this).hide();
    var $updateTimeForm = $(this).closest(".group").find(".update-time");
    $updateTimeForm.show();
    $updateTimeForm.click(function(e){
      e.stopPropagation();
    });
    $(document).click(function(){
      $updateTimeForm.hide();
      $clickedTime.show();
    });
  })
})