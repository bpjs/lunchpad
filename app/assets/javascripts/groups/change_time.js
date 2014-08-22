$(function(){
  $("#groups").on("click", ".group-time", function(){
    $(this).hide();
    $(this).closest(".group").find(".update-time").show();
  })
})