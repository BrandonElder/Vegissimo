function removeRecipe() {
  $('.dash-close-btn').click(function(){
    var index = $(this).data('index');
    $(".dash.callout[data-index="+index+"]")
    .addClass('animated rollOut')
    .hide(1000);
  });
}

function dislikeDisappear(){
  $('.dislike').click(function(){
    $(this).parents('.card').fadeTo( "slow" , 0.3, function() {
    });
  });
}
  
$(function(){
  $.ajaxSetup({ cache: false });
  removeRecipe();
  dislikeDisappear();
});
