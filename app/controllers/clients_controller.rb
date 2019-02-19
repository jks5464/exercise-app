class ClientsController < AuthenticationController
  
  public
  
  def new
  end
  
  def homepage
    puts("Go back to the homepage")
  end
  
  def my_clients
      if !current_effective_user_is_trainer? then
        redirect_to dashboard_path
      end
      
      puts("Displaying my clients page")
      puts("User has user_id: #{session[:user_id]}")
      puts("User has effective_id: #{session[:effective_id]}")
      
      @clients = current_user.clients
      @clients = [] if (@clients.nil?)
  end
  
end
