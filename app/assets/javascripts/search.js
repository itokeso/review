$(function(){

  var search_list = $(".review__select__modal__content__title");

  function appendAnime(anime) { 
    let html =  `<label class="label__field1" data-anime-genre="${anime.genre}" data-anime-id="${anime.id}" data-anime-image="${anime.image.url}" data-anime-title="${anime.title}" for="label">
                  <div class="review__select__modal__content__title">
                  <img class="review__select__modal__content__title__left">
                  <img class="anime__image" style="background-image: url(${anime.image.url})">
                    <div class="review__select__modal__content__title__right">
                      <div class="review__select__modal__content__title__right__title">${anime.title}</div>
                      <div class="review__select__modal__content__title__right__genre">ジャンル: ${anime.genre}</div>
                      <a class="review__select__modal__content__title__right__btn></div>
                    </div>
                  </div>
              </label>`
          search_list.append(html)        
      }
    function appendErrMsg(msg) {
      let html = `<div class='name'>${msg}</div>`
      search_list.css({'background-color':'white', 'border': 'none'}).append(html);
    }

    function addForm(title, id, genre, image) {
      let html = `<div class="review__form" style="display: block; id= ${id}">
                    <div class="review__form__anime">
                      <img class="review__form__anime__left" style="background-image: url(${image})">
                        <div class="review__form__anime__right">
                          <div class="review__form__anime__right__title">
                            ${title}
                          </div>
                          <div class="review__form__anime__right__genre">
                            ジャンル: ${genre}
                          </div>
                        </div>
                    </div>
                  </div>`
          $('.review__text').empty().append(html)
    }

    function appendForm(title, id, genre, image) {
      let html = `<div class="review__form" style="display: block; id= ${id}">
                    <div class="review__form__anime">
                      <img class="review__form__anime__left" style="background-image: url(${image})">
                        <div class="review__form__anime__right">
                          <div class="review__form__anime__right__title">
                            ${title}
                          </div>
                          <div class="review__form__anime__right__genre">
                            ジャンル: ${genre}
                          </div>
                        </div>
                    </div>
                  </div>`
          $('.review__text').empty().append(html)
    }

// インクリメンタルサーチ
  $('input[type="search"]').on('keyup', function(){
    var input = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(anime) {
    　$(".review__select__modal__content__title").empty();
    if (anime.length !== 0) {
        anime.forEach(function(anime){
        appendAnime(anime);    
      });
    
    } else if (input.length == 0) {
      return false;
    }  else {
        appendErrMsg("一致するアニメはありません。");
    }
　　　 }) 
    .fail(function(){
      alert('通信エラーです')
    });
  });   

  $('.label__field').on('click', function(){
    const title = $(this).attr("data-title")
    const id    = $(this).attr("data-id")
    const genre = $(this).attr("data-genre")
    const image = $(this).attr("data-image")
    $('.review__select__modal').fadeOut();
    $('.review__select').hide()
      addForm(title, id, genre, image)
  });


  // ラベルを押したらアニメが追加される
  $(document).on('click', '.label__field1', function() {
  
    const animeTitle = $(this).attr("data-anime-title");
    const animeId    = $(this).attr("data-anime-id");
    const animeGenre = $(this).attr("data-anime-genre");
    const animeImage = $(this).attr("data-anime-image");

    $('.review__select__modal').fadeOut()
    $('.review__select').hide()
    appendForm(animeTitle, animeId, animeGenre, animeImage)
  }); 
});