$(document).on('turbolinks:load', function() {
  $(".tab-label").on("click", function(){
    var $th = $(this).index();
    $(".tab-label").removeClass("active");
    $(".mypage-item-list").removeClass("active");
    $(this).addClass("active");
    $(".mypage-item-list").eq($th).addClass("active");
  });
})

// $(function() {
//   $(".tab-notification").on("click", function(){
//     var $th = $(this).index();
//     $(".tab-notification").removeClass("active");
//     $(".mypage-item-list").removeClass("active");
//     $(this).addClass("active");
//     $(".mypage-item-list").eq($th).addClass("active");
//   });
// });

// $(function() {
//   $(".tab-label:nth-child(1)").addClass("active");
//   $(".tab-label").on("click", function(){
//     var num = $(this).parent().children('.tab-label').index(this);
//     $(this).parent('.notification-todo__tabs').each(function(){
//       $('>',this).removeClass('current').eq(num).addClass('current');
//     });

//   });
// });


