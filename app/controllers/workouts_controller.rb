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
  
  def self.insert_new_workout(workout_name, task_card_data)
    new_workout = current_user.workout.create(name: workout_name, uid: 0, completed: false)
    task_card_data.each do | i, td |
      exercise = Exercise.get_by_name(td['exercise_name'])
      new_task = new_workout.task.create(exercise_id: exercise.id, completed: false)
      (1..td["set_count"].to_i).each do | i |
        new_task.exercise_set.create(rep_count: td["rep_count"], rep_value: td["rep_value"], rep_unit: td["rep_unit"], completed: false)
      end
    end
  end
  
  def process_create_workout
    puts("Inserting new workout to database...")
    name = params[:name]
    Workout.create(user_id: session[:user_id], name: name)
    redirect_to my_workouts_path
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
