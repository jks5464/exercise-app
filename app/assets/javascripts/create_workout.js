$(function() {
  // object for autocomplete data processing
  new app.Search_Exercises;
});


$(function() {
  var dialog, form,
  name = $( "#exercise-search-txt" )
  number = $( "#dist" ),
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

  function make_task_card() {
    var markup = "";
    
    var form_type = $('#form_type').text().trim();
    
    var name = $("#exercise-search-txt").val();
    if (form_type == "Strength") {
      var sets = $("#sets").val();
      var reps = $("#reps").val();
      var weight = $("#weight").val();
      var units = $("#units").val();
      markup = "<div>" + name + " " + sets + " " + reps + " " + weight + " " + units + "</div>";
      
      
    } else if (form_type == "Cardio") {
      var distance_time = $("#distance_time").val();
      var units = $("#units").val();
      markup = "<div>" + name + " " + distance_time + " " + units + "</div>";
      
    }
    
    return markup;
  }
  
  function create_exercise_set() {
    var valid = true;
    allFields.removeClass( "ui-state-error" );
  
    var selectedExercise = document.getElementById("exercise-search-txt").value;
      
      $( "#task_card_list" ).append(make_task_card());
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
      $("#exercise-category-data").html("");
      allFields.removeClass( "ui-state-error" );
    }
  });
    
  form = dialog.find( "form" ).on( "submit", function( event ) {
    event.preventDefault();
    create_exercise_set();
  });
});

function get_task_card_data() {
  var results = [];
  $("#")
  
}

$("#finish").click(function() {
  var task_card_data = get_task_card_data();
  
  $.ajax({
      type:"POST",
      url:"/process_create_workout",
      data: {
        task_card_data
      }
  });
});

