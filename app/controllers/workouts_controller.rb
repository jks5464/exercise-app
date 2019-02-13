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
    user = current_user
    
    Workout.insert_new_workout(user, workout_name, task_card_data, State.saved, State.saved, State.saved)

    puts("New workout inserted")
    puts("!"*100)
    render json: { redirect_path: my_workouts_path }
  end
  
  def process_complete_workout
    complete = params[:complete]
    workout_id = params[:workout_id]

    puts("marking complete...")
    Workout.update_state(workout_id, State.complete)
    puts("done.")
    render json: { status: 200 }
  end
  
  def process_clone_workout
    workout_id = params[:workout_id]
    
    puts("Cloning a workout")
    clone_id = Workout.clone(current_user, workout_id)
    puts("done.")
    
    render json: {clone_id: clone_id}
  end
  
  def process_update_workout_state
    workout_id = params[:workout_id]
    new_state = params[:state]
    
    puts("Updating workout state...")
    
    if State.valid_state?(new_state) then
      Workout.update_state(workout_id, new_state)
      puts("done.")
      render json: { status: 200 }
    else
      puts("Invalid workout state #{new_state}")
      render json: { status: 500 }
    end
    
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
