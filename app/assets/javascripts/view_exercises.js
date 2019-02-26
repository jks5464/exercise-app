$(function() {
  // setup delte button for exercise
  $(".delete_button").click(function() {
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
  });
  
  $("#edit-exercises").click(function() {
    $(".show_when_editing").css("display", "inline-block");
    $(".hide_when_editing").css("display", "none");
    });
    
  
  $("#done-editing").click(function() {
    $(".show_when_editing").css("display", "none");
    $(".hide_when_editing").css("display", "inline-block");
    });
});




