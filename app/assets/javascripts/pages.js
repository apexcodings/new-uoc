$(function() {
  $(".page-container h3.accordion").next().hide();

  $(".page-container h3.accordion").click(function() {
    $(this).next().slideToggle();
    //$(this).toggleClass('info-open');
  });
});
