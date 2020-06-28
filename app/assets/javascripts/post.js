// 文字数カウント
$(function(){
  $('.review__form__field').on('keyup', function(){
    let count = $(this).val().length;
    $('.review__form__title__count').text(count + '文字（200文字未満の感想は作品ページに表示されませんのでご了承ください）')
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
