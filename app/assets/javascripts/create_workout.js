$(function() {
    // object for autocomplete data processing
    new app.Search_Exercises;
});


$(function() {
    var dialog, form,
    name = $( "#name" )
    number = $( "#number" ),
    units = $( "#units" ),
    allFields = $( [] ).add(name).add(number).add(units);

    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        return false;
      } else {
        return true;
      }
    }

    function create_exercise_set() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
      
      valid = valid && checkLength( number, "number", 0, 3 );
      valid = valid && checkLength( units, "units", 1, 10 );
    
      var selectedExercise = document.getElementById("exercise-search-txt").value;
      
    
        $( "#users tbody" ).append( "<tr>" +
          "<td>" + selectedExercise + "</td>" +
          "<td>" + number.val() + "</td>" +
          "<td>" + units.val() + "</td>" +
        "</tr>" );
        dialog.dialog( "close" );
      
      return valid;
    } 

    $( "#add" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });

    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Enter exercise": create_exercise_set,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
    
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      create_exercise_set();
    });
});

