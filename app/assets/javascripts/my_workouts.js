$(function() {
  
  function get_workout_card(t) {
    return $(t).parent().parent().parent();
  }
  
  // sends request to delete 'workout_id' from database
  function delete_workout(workout_id) {
    $.ajax({
      type:"POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url:"/process_delete_workout",
      data: {
       "workout_id" : workout_id,
      }
    });
  }
  
  // sanitizes input string which is supposed to be a number
  function sanitize_number_input(input) {
    var default_input = "1";
    input = (isNaN(input)) ? default_input : input;
    return (Number(input) > Number(default_input)) ? input : default_input;
  }
  
  // setup complete buttons for planned workouts
  $("#planned-workouts").on('click', '.complete_workout_button', function() {
    var workout_card = get_workout_card(this);
    var workout_id = workout_card.attr('id');
    workout_card.remove();
    
    $.ajax({
      type:"POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url:"/process_complete_workout",
      data: {
       "workout_id" : workout_id,
      }
    });
  });
  
  // setup plan workout buttons
  $(".plan_workout_button").click(function() {
    var workout_card = get_workout_card(this);
    var id = workout_card.attr('id');
    
    var cloned_workout = workout_card.clone();
    cloned_workout.find(".plan_workout_button").removeClass("plan_workout_button").addClass('complete_workout_button');
    cloned_workout.find(".complete_workout_button").html("Complete")
   
    $("#planned-workouts").append(cloned_workout);
    
    $.ajax({
      type:"POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url:"/process_clone_workout",
      data: {
       "workout_id" : id
      },
      success: function(o) {
        clone_id = o.clone_id;
        clone_task_id_hash = o.clone_task_id_hash;
        clone_set_id_hash = o.clone_set_id_hash;
        
        // set new clone ids
        cloned_workout.attr('id', clone_id);
        cloned_workout.find(".task_card").each(function() {
          var old_id = $(this).attr("id");
          $(this).attr("id", clone_task_id_hash[old_id]);
          
        });
        cloned_workout.find(".set_card").each(function() {
          var old_id = $(this).attr("id");
          $(this).attr("id", clone_set_id_hash[old_id]);
        });
      },
      complete: function(o) {
        clone_id = cloned_workout.attr('id');
        
        $.ajax({
          type:"POST",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url:"/process_update_workout_state",
          data: {
           "workout_id" : clone_id,
           "state" : "planned"
          }
        });
      }
    });
  });
  
  
  // setup edit buttons for all workouts
  $("#all-workouts").on('click', '.edit_workout_button', function() {
    var workout_card = get_workout_card(this);
    
    // pre-set edit inputs to current displayed values
    workout_card.find(".set_card").each(function() {
      var current_rep_count = $(this).find(".rep_count_info").text();
      var current_rep_value = $(this).find(".rep_value_info").text();
      $(this).find(".rep_count_edit").val(current_rep_count);
      $(this).find(".rep_value_edit").val(current_rep_value);  
    });
    
    
    workout_card.find(".show_form").css('display', 'none');
    workout_card.find(".edit_form").css('display', 'inline-block');
  });
  
  // setup done buttons for all workouts
  $("#all-workouts").on('click', '.done_button', function() {
    var workout_card = get_workout_card(this);
    
    // update each exercise set
    workout_card.find(".set_card").each(function() {
      var exercise_set_id = $(this).attr("id");
      var new_rep_count    = $(this).find(".rep_count_edit").val();
      var new_rep_value  = $(this).find(".rep_value_edit").val();
      
      new_rep_count = sanitize_number_input(new_rep_count);
      new_rep_value = sanitize_number_input(new_rep_value);
      
      $.ajax({
        type:"POST",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url:"/process_update_exercise_set",
        data: {
         "exercise_set_id" : exercise_set_id,
         "rep_count" : new_rep_count,
         "rep_value" : new_rep_value
        }
      });
        
      $(this).find(".rep_count_info").text(new_rep_count);
      $(this).find(".rep_value_info").text(new_rep_value);
      
      
    });
    
    // toggle show/hide the show/edit forms
    workout_card.find(".show_form").css('display', 'inline-block');
    workout_card.find(".edit_form").css('display', 'none');
  });
  
  // setup delete buttons for all workouts 
  $("#all-workouts").on('click', '.delete_workout_button', function() {
    var workout_card = get_workout_card(this);
    var workout_id = workout_card.attr('id');
    workout_card.remove();
    delete_workout(workout_id);
  });
  
});