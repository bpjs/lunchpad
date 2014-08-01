$(function() {

  // $('.review-form').click(function(e) {
  //   e.preventDefault();
  //   closeForm($(this));
  // });

  $('#reviews').on('click', '[id$="-cancel"]', function(e) {
    e.preventDefault();
    closeForm($(this));
  });

  function closeForm($cancelButton) {
    var $reviewForm = $cancelButton.closest('.review-form');
    $reviewForm.slideUp('normal', function() {
      $(this).siblings('div').slideDown();
      $(this).remove();
    });
  }
});

