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
});




