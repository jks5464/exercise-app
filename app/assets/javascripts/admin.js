$(function() {
    
  $(".delete_client_button").click(function() {
    var result = confirm("Are you sure?");
    if (result) {
        var trainer_card = $(this).parent().parent();
        var client_card = $(this).parent();
        
        var client_id = client_card.attr('id');
        var trainer_id = trainer_card.attr('id');
        
        client_card.remove();
        
        $.ajax({
          type:"POST",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url:"/process_delete_client",
          data: {
           "trainer_id" : trainer_id,
           "client_id" : client_id
          }
        });    
    }
  });

    
});