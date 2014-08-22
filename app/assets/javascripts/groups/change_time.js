$(function(){
  $("#groups").on("click", ".group-time", function(e){
    e.stopPropagation();
    $(this).hide();
    var $updateTimeForm = $(this).closest(".group").find(".update-time");
    $updateTimeForm.show();
    $updateTimeForm.click(function(e){
      e.stopPropagation();
    });
    $(document).click(function(){
      $updateTimeForm.hide();
    });
  })
})