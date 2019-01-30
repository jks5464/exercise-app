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
    task_card_data = params[:task_card_data]
    puts("Received task_card_data: #{task_card_data}")
    puts("!"*100)
    render json: { redirect_path: my_workouts_path }
  end
  
  def search_exercises_json
    @exercises = Exercise.search(params[:term])
    respond_to :json
  end
  
  def units_json
    puts("dumping units from database")
    @units = Unit.all()
    respond_to :json
  end
  
end
