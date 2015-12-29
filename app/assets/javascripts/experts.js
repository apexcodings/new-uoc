$(function() {
  $(".expert-details h3").click(function() {
    $(this).next().slideToggle();
    $(this).toggleClass('info-open');
  });
});
