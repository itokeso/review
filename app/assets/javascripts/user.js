$(function(){
  $('.content__name__field').on('blur',function(){
    if($(this).val() == ""){
      $(this).siblings('span.error_name').text("※入力必須項目です");
    } else {
      $(this).siblings('span.error_name').text("");
    }
  });
  $('.content__email__field').on('blur',function(){
    if($(this).val() == ""){
      $(this).siblings('span.error_email').text("※入力必須項目です");
    } else {
      $(this).siblings('span.error_email').text("");
    }
  });
  $('.content__password__field').on('blur',function(){
    if($(this).val() == ""){
      $(this).siblings('span.error_pass').text("※入力必須項目です");
    } else {
      $(this).siblings('span.error_pass').text("");
    }
  });
  $('.content__password__comfirm').on('blur',function(){
    if($(this).val() == ""){
      $(this).siblings('span.error_pass2').text("※入力必須項目です");
    } else {
      $(this).siblings('span.error_pass2').text("");
    }
  });

// $(".content__name__field").on('blur', function(){
//   if(!$(this).val().match(/^[ぁ-んァ-ンー-龥 ]{1,12}$/) && !$(this).val().length == 0){
//     $(this).siblings('span.error_name').text("※正しく入力して下さい");
//   } else {
//     $(this).siblings('span.error_name').text("");
//   }
//   });
// $(".content__email__field").on('blur', function(){
//   if(!$(this).val().match(/^[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+$/) && !$(this).val().length == 0) {
//     $(this).siblings('span.error_email').text("※正しく入力してください");
// } else {
//     $(this).siblings('span.error_email').text("");
//   }
//   });
// $(".content__password__field").on('blur', function(){
//   if(!$(this).val().match(/^[a-z\d]{8,100}$/i) && !$(this).val().length == 0) {
//     $(this).siblings('span.error_pass').text("※正しく入力して下さい");
//   } else {
//     $(this).siblings("span.error_pass").text("");
//   }
//   })
// $(".content__password__comfirm").on('blur', function(){
//   if(!$(this).val().match(/^[a-z\d]{8,100}$/i) && !$(this).val().length == 0) {
//   $(this).siblings('span.error_pass2').text("※正しく入力して下さい");
//   }
  // })
});