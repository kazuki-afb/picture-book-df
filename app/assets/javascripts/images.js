// $(function(){
//   // 画像を登録したら.image_arrayに画像が表示される
//   $('.image__select').on('submit',function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       cotentType: false
//     })
//   })
// });
// 実装したい事：image_arrayのboxをクリックしたら.image_mainに画像が表示される。
$(function(){
  // DOM取得してimagesに変数定義
  let images = $('.box');

  // showImageアクション定義
  function showImage() {
    // imagesのクリックした場所のindexをindex変数にする
    const index = images.index(this);
    // クリックしたら画像を消す
    $('.img.big.active').removeClass('active');
    // 画像を表示する
    $('.img.big').eq(index).addClass('active');
  }
  // クリックしたらshowImageアクション発火
  images.click(showImage);
});