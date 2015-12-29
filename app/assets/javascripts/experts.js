$(function() {
  //$(".info-section").css('display', 'none');
  //$(".background").css('display', 'block');
  //$('.details h3').next().css('border', '1px solid green');

  $(".expert-details h3").click(function() {
    $(this).next().slideToggle();
    $(this).toggleClass('info-open');
  });
});
