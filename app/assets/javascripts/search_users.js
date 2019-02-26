var app = window.app = {};


var cardio_template = "";
var strength_template = "";
/*
Search_Exercises enables exercise search autocomplete input work.
TUTORIAL: https://www.lugolabs.com/articles/jquery-ui-autocomplete-with-ruby-on-rails
*/
app.Search_Exercises = function() {
  /*
  Class Members:
    _input -> jQuery selector. Specifies where to receive input text.
  */
  
  this._input = $('#exercise-search-txt');
  this._initAutocomplete();
};

app.Search_Exercises.prototype = {

};

app.Search_Exercises.prototype._initAutocomplete = function() {
  $.ajax({
      type:"GET",
      url:"/units_json",
      complete: function(o){
          var j = JSON.parse(o.responseText);
          
          var cardio_units_markup = '<select id="units">';
          var strength_units_markup = '<select id="units">';
          for (var i = 0; i < j.length; ++i) {
            var obj = j[i];
            var obj_markup = "<option value=" + obj.name + ">" + obj.name + "</option>";
            
            if (obj.category == "Cardio") {
              cardio_units_markup += obj_markup;
            } else if (obj.category == "Strength") {
              strength_units_markup += obj_markup;
            }
          }
          cardio_units_markup += "</select>";
          strength_units_markup += "</select>";
          
          cardio_template = `<form><fieldset>
                <div> 
                  <label for="number">
                      Distance/Time
                    </label>
                    <input type="text" name="number" id="distance_time" min="1" value="1" class="text ui-widget-content ui-corner-all">
                </div>` +
                
                `<div>` + 
                cardio_units_markup + 
                `</div>` +
                
                `<div>
                  <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
                </div>
                
                <div id="form_type" hidden>
                  Cardio
                </div>
                
                </fieldset></form>`;
                
          strength_template = `<form><fieldset>
                <div> 
                  <label for="sets">
                    Sets
                  </label>
                  <input type="number" name="sets" min="1" max="100" value="1" id="sets">
                </div>
                
                <div>
                  <label for="reps">
                    Reps
                  </label>
                  <input type="number" name="reps" min="1" max="100" value="1" id="reps">
                </div>
                
                <div>
                  <label for="weight">
                    Weight
                  </label>
                  <input type="number" name="weight" min="1" max="1000" value="1" id="weight">
                </div>` +
                
                `<div>` +
                  strength_units_markup +
                `</div>` +
                
                `<div>
                  <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
                </div>
                
                <div id="form_type" hidden>
                  Strength
                </div>
                
                </fieldset></form>`;
      }
  });
  
  this._input
    .autocomplete({
      source: '/search_exercises_json',     // where to send text
      appendTo: '#exercise-search-results', // where to append response
      select: $.proxy(this._select, this)   // function called when option selected
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

// Called when item is selected from autocomplete list
app.Search_Exercises.prototype._select = function(e, ui) {
  this._input.val(ui.item.name);
  
  var markup = "";
  if (ui.item.category == "Cardio") {
    markup = cardio_template;
  } else if (ui.item.category == "Strength") {
    markup = strength_template;
  } else {
    markup = "No template exists for a " + ui.item.category + " exercise";
  }
  
  $('#exercise-category-data').html(markup);
  return false;
}

// Renders item in html
app.Search_Exercises.prototype._render = function(ul, item) {
  var markup = [
    '<span class="name">' + item.name + '</span>',
    '<span class="category">' + item.category + '</span>',
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}