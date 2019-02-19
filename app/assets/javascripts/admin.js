$(function() {
  // setup delte button for exercise
  $(".trainer").click(function() {
    
    var user_id = $(this).attr('id');
    
      $.ajax({
        type:"POST",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url:"/process_admin",
        data: {
          "trainer_id" : user_id
        }
    });
  });
    $(".admin").click(function() {
    
    var user_id = $(this).attr('id');
    
      $.ajax({
        type:"POST",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url:"/process_admin",
        data: {
          "clients_id" : user_id
        }
    });
  });
  
  
});




