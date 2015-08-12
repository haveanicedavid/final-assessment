$(document).ready( function() {
  $('.name-search').on('keyup', function() {
    var searchTerm = new RegExp($(".name-search").val(), "i");
    $('.teh-classes').children().each(function(index, element) {
      if (findMatch(element, searchTerm)) {
        $(element).show();
      } else {
        $(element).hide();
      }
    });
  });

});

function findMatch(element, searchTerm) {
  var output = false;
  $(element).children().each(function (i, e, a) {
    if ($(e).html().match(searchTerm)) {
      output = true;
    }
  });
  return output;
}