$(function() {
  // setup delte button for exercise
  $(".delete_button").click(function() {
    var result = confirm("Are you sure?");
    if (result) {
      $(this).parent().parent().remove();
      var exercise_id = $(this).attr('id');
        $.ajax({
          type:"POST",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url:"/process_delete_exercise",
          data: {
            "exercise_id" : exercise_id
          }
      });
    }
  });
  
  $("#edit-exercises").click(function() {
    $(".show_when_editing").css("display", "inline-block");
    $("table").each(function() {
      $(this).find(".show_when_editing").css("display", "table-cell");
    });
    $(".hide_when_editing").css("display", "none");
  });
    
  
  $("#done-editing").click(function() {
    var exercises_table = $("#exercises_table");
    var new_exercises = [];
    exercises_table.find(".exercise_row").each(function() {
      var exercise_id = $(this).attr("id");
      var new_data = {};
      new_data["exercise_id"] = exercise_id;
      new_data["name"]        = $(this).find(".name_edit").val().trim();
      new_data["category"]    = $(this).find(".category_edit :selected").val().trim();
      new_data["description"] = $(this).find(".description_edit").val().trim();
      new_exercises.push(new_data);
    });
    
    $.ajax({
      type:"POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url:"/process_update_exercises",
      data: {
        "new_exercises": new_exercises,
      }, 
      complete: function(o) {
        window.location.reload(true);  
      }
    });
  });
});




