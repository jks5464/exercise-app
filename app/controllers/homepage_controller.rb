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
    @exercises = Exercise.all
    @exercises = [] if (@exercises.nil?)
    
    puts("Displaying user's workouts...")
    @current_user = current_user()
    
    @workouts = @current_user.workout
    @workouts = [] if (@workouts.nil?)
  end
  
  def process_new_quick_log
    puts("Creating new quick log...")
    puts("="*100)
    user = current_user
    workout_name = "Workout_" + current_user.id.to_s + "_" + Time.now.to_s
    task_card_data = params[:task_card_data]
    Workout.insert_new_workout(user, workout_name, task_card_data, State.complete, State.complete, State.complete)
    head :ok, content_type: "text/html"
  end
  
  def view_exercises
    puts("Displaying view exercises page")
    @exercises = Exercise.all
    @units = Unit.all
  end
    
  
end
