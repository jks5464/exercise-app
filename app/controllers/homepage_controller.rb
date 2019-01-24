class HomepageController < AuthenticationController

  public
  
  def new
  end
  
  def show
    puts("showing the progress")
  end

  
  def dashboard
    puts("dashboard showing")
  end
  
  def my_measurement
    puts("Displaying my measurements page")
  end
  
  def my_workout
    puts("Displaying my workout page")
  end
  
  def my_goals
    puts("my recent goal")
  end 
  
  def homepage
    puts("go back to the homepage")
  end
  
  def quick_log
    puts("Displaying quick log page...")
    puts("Displaying list of exercises")
    @exercises = Exercise.where(user_id: session[:user_id])
    @exercises = [] if (@exercises.nil?)
  end
  
end
