var app = window.app = {};



app.Search_Exercises = function() {
  this._input = $('#exercise-search-txt');
  this._initAutocomplete();
};

app.Search_Exercises.prototype = {

};

app.Search_Exercises.prototype._initAutocomplete = function() {
  this._input
    .autocomplete({
      source: '/search_exercises_json',
      appendTo: '#exercise-search-results',
      select: $.proxy(this._select, this)
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

app.Search_Exercises.prototype._select = function(e, ui) {
  this._input.val(ui.item.name);
  return false;
}

app.Search_Exercises.prototype._render = function(ul, item) {
  var markup = [
    '<span class="name">' + item.name + '</span>',
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}