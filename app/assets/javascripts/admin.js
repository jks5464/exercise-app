$(function() {
    // Get the modal
    var modal = document.getElementById('myModal');
    
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");
    
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    
    // When the user clicks the button, open the modal 
    btn.onclick = function() {
      modal.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
    
    // setup plan workout buttons
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