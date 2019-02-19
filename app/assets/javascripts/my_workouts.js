$(function() {
  
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
  
  // setup complete buttons for planned workouts
  $("#planned-workouts").on('click', '.complete_workout_button', function() {
    
    var workout_id = $(this).parent().parent().attr('id');
    $(this).parent().parent().remove();
    
    $.ajax({
      type:"POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url:"/process_complete_workout",
      data: {
       "workout_id" : workout_id,
      }
    });
  });
  
  // setup delete buttons for saved workouts 
  $("#saved-workouts").on('click', '.delete_workout_button', function() {
    
    var workout_id = $(this).parent().parent().attr('id');
    $(this).parent().parent().remove();
    delete_workout(workout_id);
  });
  
  // setup delete buttons for planned workouts 
  $("#planned-workouts").on('click', '.delete_workout_button', function() {
    
    var workout_id = $(this).parent().parent().attr('id');
    $(this).parent().parent().remove();
    delete_workout(workout_id);
  });
  
  // setup plan workout buttons
  $(".plan_workout_button").click(function() {
    var workout_card = $(this).parent().parent();
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
        clone_id = o.clone_id
        cloned_workout.attr('id', clone_id);
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
  
  // setup edit buttons for saved workouts
  $("#planned-workouts").on('click', '.edit_workout_button', function() {
    $(this).parent().parent().find(".show_form").css('display', 'none');
    $(this).parent().parent().find(".edit_form").css('display', 'inline-block');
  });
  
});