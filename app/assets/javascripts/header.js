$(function(){
  $("#list").css('display', 'none');
  $('#mypage').on('click', function(){
    $('#list').slideToggle(300);
    $(this).toggleClsss('active');
  })
})