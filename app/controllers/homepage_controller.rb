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
    @exercises = Exercise.all
    @exercises = [] if (@exercises.nil?)
  end
  
  def create_new_quick_log
    puts("Creating new quick log...")
    # category = params[:category]
    # quick_log_data = get_quick_log_data(category, params)
=begin
    workout = Workout.create(name = "quicklog-unique-id", 
             uid = not sure, 
             user_id = current_user.id, 
             completed = true)
    exercise = exercise_with_name(params[:exercise_name])
    task = Task.create(exercise_id = exercise.id
                       workout_id = workout.id,
                       completed = true)
    set = Set.create()
    # ====> Set  
=end
    # workout = current_user.workouts.create("quicklog-1")
    # task = workout.tasks.create("quicklog-task-1")
    # task.sets.create(quick_log_data)
    # task.
  end
  
end
