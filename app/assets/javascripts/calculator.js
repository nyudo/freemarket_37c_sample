$(document).on('turbolinks:load', function(){
  $('#amount').on('input', function(){
    var amount = $('#amount').val();
    var commission = Math.floor(amount * 0.1);
    var profit = (amount - commission);
    var commission = String(commission).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    var profit = String(profit).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    if (!isNaN(amount)){
    $('#commission').html("¥" + commission);
    $('#sales-profit').html("¥" + profit);
    }else{
      alert("半角数字で入力してください");
    }
  });
});
