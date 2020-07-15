// フォームバリデーション
$(function(){
  $('.content__name__field').on('blur', function(){
    if ($(this).val() == "") {
      $(this).siblings('span.error_name').text("*入力必須項目です");
      $(this).css({
        backgroundColor: 'pink',
      })
    } else if (!$(this).val().match(/^[ぁ-んァ-ンー-龥]{1,12}$/) && !$(this).val().length == 0) {
      $(this).siblings('span.error_name').text('*正しく入力して下さい');
    } else {
      $(this).siblings('span.error_name').text("");
      $(this).css({
        backgroundColor: 'white',
      })
    }
  })

  $('.content__email__field').on('blur', function(){
    if($(this).val() == ""){
      $(this).siblings('span.error_email').text("*入力必須項目です");
      $(this).css({
        backgroundColor: 'pink',
      })
    } else if (!$(this).val().match(/^[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+$/) && !$(this).val().length == 0) {
      $(this).siblings('span.error_email').text('*正しく入力して下さい');
    } else {
      $(this).siblings("span.error_email").text("");
      $(this).css({
        backgroundColor: 'white',
      })
    }
  })

  $('.content__password__field').on('blur', function(){
    if($(this).val() == "") {
      $(this).siblings('span.error_pass').text('*入力必須項目です');
      $(this).css({
        backgroundColor: 'pink',
      })
    } else if (!$(this).val().match(/^[a-z\d]{8,100}$/i) && !$(this).val().length == 0 ) {
      $(this).siblings('span.error_pass').text('*正しく入力して下さい');
    } else {
      $(this).siblings('span.error_pass').text("");
      $(this).css({
        backgroundColor: 'white',
      })
    }
  })

  $('.content__password__confirm').on('blur', function(){
    if($(this).val() == "") {
      $(this).siblings('span.error_pass2').text('*入力必須項目です');
      $(this).css({
        backgroundColor: 'pink',
      })
    } else if(!$(this).val().match(/^[a-z\d]{8,100}$/i) && !$(this).val().length == 0) {
      $(this).siblings('span.error_pass2').text("※正しく入力して下さい");
    } else {
      $(this).siblings('span.error_pass2').text("");
      $(this).css({
        backgroundColor: 'white',
      })
    }
  })
});

// ログインバリデーション
$(function(){
  $('.email__field').on('blur', function(){
    if($(this).val() == "") {
      $(this).siblings('.error_session_email').text("*入力必須項目です")
      $(this).css({
        backgroundColor: 'pink'
      })
    } else if 
    (!$(this).val().match(/^[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+$/) && !$(this).val().length == 0) {
      $(this).siblings('.error_session_email').text('*正しく入力して下さい');
    } else {
      $(this).siblings(".error_session_email").text("");
      $(this).css({
        backgroundColor: 'white',
      })
    }
  })

  $('.pass__field').on('blur',function(){
    if($(this).val() == "") {
      $(this).siblings('.error_session_pass').text("*入力必須項目です")
      $(this).css({
        backgroundColor: 'pink'
      })
    } else if 
      (!$(this).val().match(/^[a-z\d]{8,100}$/i) && !$(this).val().length == 0) {
        $(this).siblings('.error_session_pass').text("*正しく入力して下さい");
      }　else {
        $(this).siblings('.error_session_pass').text("");
        $(this).css({
          backgroundColor: "white"
        })
      }
  })
});

