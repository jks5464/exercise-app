$(function() {
  $(".plan_workout_button").click(function() {
    var workout_card = $(this).parent().parent();
    var id = workout_card.attr('id');
    
    cloned_workout = workout_card.clone();
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
  
});