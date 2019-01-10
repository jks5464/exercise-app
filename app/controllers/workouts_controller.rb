class WorkoutsController < AuthenticationController
  
  public
  
  def new
  end
  
  def homepage
    puts("Go back to the homepage")
  end
  
  def my_workouts
    puts("Displaying my workouts page")
    puts("User has id: #{session[:user_id]}")
    @workouts = Workout.where(user_id: session[:user_id])
    @workouts = [] if (@workouts.nil?)
  end
  
  def create_workout
    puts("Displaying create workout page")
  end
  
  def process_create_workout
    puts("Inserting new workout to database...")
    name = params[:name]
    
    Workout.create(user_id: session[:user_id], name: name)
  
    redirect_to my_workouts_path
  end
  
end
