/* global $*/

function toggleFilters(){
  $('.filters').on('click',function(){
    $("#searchFilters").slideToggle("fast");
  });
}

function changeButton() {
  $('.clean-btn').click(function(e){
    var url = window.location.href;
    var buttonId = $(this).data('button-id');
    setTimeout(function(){
      $('#change-favorites-' + buttonId).load(url + ' #change-favorites-' + buttonId);
      $('#change-favorites-' + buttonId).addClass('animated pulse');
    }, 100);
  });
}

function hideForm(){
    var hidden = $('#get-form').hasClass('hidden-btn');
    if( hidden){
      $('.form-container').css('display', 'none');
      $('#get-form').addClass('animated slideInLeft');
    }else{
      $('.form-container').css('display', 'block');
    }
}

function showForm(){
 $('#get-form').click(function(e){
   $('.form-container').show('animated slideInLeft');
   $('#get-form').addClass('animated zoomOutLeft');
 });
}

function footerDropDown(){
  $('.pointer').on('click', function(e){
    var dataIndex = $(this).data('index');
    if ($(".callout-footer[data-index="+dataIndex+"]").css('display') === 'none') {
      $(".callout-footer[data-index="+dataIndex+"]").slideDown();
    }else{
      $(".callout-footer[data-index="+dataIndex+"]").slideUp();
    }
  });
}

function calAdjust(){
  $('[data-quantity="plus"]').click(function(e){
    e.preventDefault();
    fieldName = $(this).attr('data-field');
    var currentVal = parseInt($('input[name='+fieldName+']').val());
    if (!isNaN(currentVal)) {
      $('input[name='+fieldName+']').val(currentVal + 10);
    } else {
      $('input[name='+fieldName+']').val(0);
    }
});
  $('[data-quantity="minus"]').click(function(e) {
    e.preventDefault();
    fieldName = $(this).attr('data-field');
    var currentVal = parseInt($('input[name='+fieldName+']').val());
    if (!isNaN(currentVal) && currentVal > 0) {
      $('input[name='+fieldName+']').val(currentVal - 10);
    } else {
      $('input[name='+fieldName+']').val(0);
    }
  });
}

function radioLabel() {
  $('.radio-label').click(function(e){
    if ($(e.target).attr('for') === 'health_vegan_vegan'){
      $('#health_vegan').prop("checked", true);
    }
    if ($(e.target).attr('for') === 'health_vegetarian_vegetarian'){
      $('#health_vegetarian').prop("checked", true);
    }
  });
}

document.addEventListener("turbolinks:load", function() {
  $.ajaxSetup({ cache: false });
  toggleFilters();
  changeButton();
  footerDropDown();
  calAdjust();
  hideForm();
  showForm();
  radioLabel();
})

