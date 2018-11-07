$(document).on('turbolinks:load', function(){
  $('#amount').on('input', function(){
    var am = $('#amount').val();
    var ta = Math.floor(am * 0.1);
    var total = (am - ta);
    var ta = String(ta).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    var total = String(total).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    if (!isNaN(am)){
    $('#commission').html("¥" + ta);
    $('#tax1').html("¥" + total);
  }else{
    alert("半角数字で入力してください");
  }

  });
});
