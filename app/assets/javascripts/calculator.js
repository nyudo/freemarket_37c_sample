$(document).on('turbolinks:load', function(){
  $('#amount').on('input', function(){
    var amount = $('#amount').val();
    var commission = Math.floor(am * 0.1);
    var profit = (am - ta);
    var amount = String(commission).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    var total = String(total).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    if (!isNaN(am)){
    $('#commission').html("¥" + commission);
    $('#sales-profit').html("¥" + profit);
    }else{
      alert("半角数字で入力してください");
    }

  });
});
