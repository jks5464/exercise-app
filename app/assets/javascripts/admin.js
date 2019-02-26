$(function() {


$("#TOC").click(function() {
  var user_role_data = [];
  $('.user_info').each(function(i, sel){
    var role_id = $(this).find(".roles :selected").attr('id');
    var user_id = $(this).find(".id").text();
    alert(role_id);
    var data = {"user_id" : user_id, "role_id" : role_id};
    user_role_data.push(data);
    
  });
  
  $.ajax({
    type:"POST",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    url:"/process_admin",
    data: {
      "user_role_data": user_role_data,
    }
  });
});
});

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

