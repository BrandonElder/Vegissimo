function removeRecipe() {
  $('.dash-close-btn').click(function(){
    var index = $(this).data('index');
    $(".dash.callout[data-index="+index+"]")
    .addClass('animated rollOut')
    .hide(1000);
  });
}
  
$(function(){
  removeRecipe();
});
