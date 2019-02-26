$(function() {
  // object for autocomplete data processing
  new app.Search_Users;
});

$(function() {
  
  function clear_user_data() {
    $("#selected_user_id").text("");
    $("#selected_trainer_id").text("");
    
    
  }
  
  function add_client_to_trainer_client_list() {
    
    var client_id = $("#selected_user_id").text();
    var trainer_id = $("#selected_trainer_id").text();
    $.ajax({
          type:"POST",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url:"/process_add_client",
          data: {
           "trainer_id" : trainer_id,
           "client_id" : client_id
          },
          complete: function() {
            clear_user_data();
            window.location.reload(true);
          }
        });
    dialog.dialog( "close" );
      
  }
  
  $( ".add_client_button" ).button().on( "click", function() {
    var trainer_id = $(this).attr("id");
    $("#selected_trainer_id").text(trainer_id);
    dialog.dialog( "open" );
  });
  
  dialog = $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 400,
    width: 350,
    modal: true,
    buttons: {
      "Add": add_client_to_trainer_client_list,
      Cancel: function() {
        dialog.dialog( "close" );
      }
    },
    close: function() {
      form[ 0 ].reset();
      clear_user_data();
    }
  });
    
  form = dialog.find( "form" ).on( "submit", function( event ) {
    event.preventDefault();
    add_client_to_trainer_client_list();
  });
});


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