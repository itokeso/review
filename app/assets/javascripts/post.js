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
    return false;
  });
  $('.far').on('click', function(){
    $('.review__select__modal').fadeOut();
    return false;
  });
});