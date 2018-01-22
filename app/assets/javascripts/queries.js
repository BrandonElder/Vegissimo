function changeButton() {
  $('.favorites').click(function(){
    var url = window.location.href;
    var buttonId = $(this).data('button-id');
    setTimeout(function(){
      $('#change-favorites-' + buttonId).load(url + ' #change-favorites-' + buttonId);
    }, 25);
  });
}

function dislikeDisappear(){
  $('.dislike').click(function(){
    $(this).parents('.recipe-box').remove();
  });
}

$(document).on('turbolinks:load', function() {
  dislikeDisappear();
  changeButton();
});