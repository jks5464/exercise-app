var app = window.app = {};

/*
Search_Users enables exercise search autocomplete input work.
TUTORIAL: https://www.lugolabs.com/articles/jquery-ui-autocomplete-with-ruby-on-rails
*/
app.Search_Users = function() {
  /*
  Class Members:
    _input -> jQuery selector. Specifies where to receive input text.
  */
  
  this._input = $('#user-search-txt');
  this._initAutocomplete();
};

app.Search_Users.prototype = {

};

app.Search_Users.prototype._initAutocomplete = function() {
  this._input
    .autocomplete({
      source: '/search_users_json.json',     // where to send text
      appendTo: '#user-search-results', // where to append response
      select: $.proxy(this._select, this)   // function called when option selected
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

// Called when item is selected from autocomplete list
app.Search_Users.prototype._select = function(e, ui) {
  this._input.val(ui.item.name);
  $("#selected_user_id").text(ui.item.id);
  return false;
}

// Renders item in html
app.Search_Users.prototype._render = function(ul, item) {
  var markup = [
    '<span class="name">' + item.name + '</span>',
    '<span class="id" hidden>' + item.id + '</span>',
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}