$(function() {
  $(".complete_workout").click(function() {
    var checked = this.checked;
    var id = $(this).parent().attr('id');
   
    if (checked) {
      $(this).parent().css("text-decoration", "line-through");
    } else {
      $(this).parent().css("text-decoration", "none");
    }
   
    $.ajax({
      type:"POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url:"/process_complete_workout",
      data: {
       "complete" : checked,
       "workout_id" : id
      }
    });
  });
  
});