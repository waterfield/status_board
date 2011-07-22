$(function() {
  setTimeout(function() {
    $("p.notice").slideUp();
    $("p.error").slideUp();
  }, 3000);
  
  $(".focus").focus();
});