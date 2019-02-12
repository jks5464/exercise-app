class ClientsController < AuthenticationController
  
  public
  
  def new
  end
  
  def homepage
    puts("Go back to the homepage")
  end
  
  def my_clients
      puts("Displaying my clients page")
      puts("User has id: #{session[:user_id]}")
      
      @clients = current_user.clients
      @clients = [] if (@clients.nil?)
  end
  
end
