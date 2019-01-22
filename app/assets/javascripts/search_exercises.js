var app = window.app = {};


/*
Search_Exercises sends and receives requests for the #exercise-search-txt field.
This tutorial explains things well: https://www.lugolabs.com/articles/jquery-ui-autocomplete-with-ruby-on-rails
*/
app.Search_Exercises = function() {
  /*
  _input -> jQuery selector. Specifies where to receive input text.
  */
  this._input = $('#exercise-search-txt');
  this._initAutocomplete();
};

app.Search_Exercises.prototype = {

};

app.Search_Exercises.prototype._initAutocomplete = function() {
  this._input
    .autocomplete({
      source: '/search_exercises_json',     // where to send text
      appendTo: '#exercise-search-results', // where to append response
      select: $.proxy(this._select, this)   // function called when option selected
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

// Sets this._input's value to item.name when item is selected in dropdown menu
app.Search_Exercises.prototype._select = function(e, ui) {
  this._input.val(ui.item.name);
  return false;
}

// Renders html to display item
app.Search_Exercises.prototype._render = function(ul, item) {
  var markup = [
    '<span class="name">' + item.name + '</span>',
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}