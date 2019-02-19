$(document).ready(function() {
    $("#css-toggle").click(function(e) {
      console.log("Running css-toggle code...")
      e.preventDefault();
      $(".btn-primary").toggleClass("change-red");
    });
    
    $(".effective-id-set").click(function(e) {
        var effective_id = $(this).attr('id');
      $.ajax({
          type:"POST",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url:"/set_effective_id",
          data: {
           "effective_id" : effective_id
          },
          success: function(data) { 
            window.location.href = data.redirect_path;
          }
      });
    });
    
    $("#effective_id-unset").click(function(e) {
      $.ajax({
          type:"POST",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url:"/unset_effective_id",
          complete: function() { 
            window.location.reload(true);
               
          }
      });
    }); 
});