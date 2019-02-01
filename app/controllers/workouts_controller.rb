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
    @workouts = current_user.workout
    @workouts = [] if (@workouts.nil?)
  end
  
  def create_workout
    puts("Displaying create workout page")
  end
  
  def process_create_workout
    puts("Inserting new workout to database...")
    workout_name = params[:workout_name]
    task_card_data = params[:task_card_data]
    
    new_workout = current_user.workout.create(name: workout_name, uid: 0, completed: false)
    task_card_data.each do | i, td |
      puts("Exercise name #{td['exercise_name']}")
      exercise = Exercise.get_by_name(td['exercise_name'])
      new_task = new_workout.task.create(exercise_id: exercise.id, completed: false)
      (1..td["set_count"].to_i).each do | i |
        new_task.exercise_set.create(rep_count: td["rep_count"], rep_value: td["rep_value"], rep_unit: td["rep_unit"], completed: false)
      end
    end
    
    
    puts("New workout inserted")
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
