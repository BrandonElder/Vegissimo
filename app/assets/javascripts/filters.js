$(document).ready(function(){
  $('.filters').on('click',function(){
    if ($("#searchFilters").css('display') === 'none') {
      $("#searchFilters").slideDown();
    }else{
      $("#searchFilters").slideUp();
    }
  });
});


// function showFilter(target) {
//   filter = document.getElementById(target)
//   if (filter.style.display === "none") {
//     filter.style.display = "block";
//   } else {
//     filter.style.display = "none";
//   }
// }

// add to search form onclick="showFilter('searchFilters')"