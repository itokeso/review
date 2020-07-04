// 文字数カウント
$(function(){
  $('#new__review, #edit__review, #new__anime__review').on('keyup', function(){
    let count = $(this).val().length;
    $('#new__count, #edit__count, #new__anime__count').text(count + '文字')
  });
});

// モーダルウインドウ
$(function(){
  $('.review__select__btn').on('click',function(){
    $('.review__select__modal').fadeIn();
  });
  $('.far').on('click', function(){
    $('.review__select__modal').fadeOut();
  });
  $(document).click(function(e){
    let target = $(e.target);

    if(target.hasClass('review__select__modal')) {
      target.fadeOut();
    }
  })
});
