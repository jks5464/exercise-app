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
    
    workout_name = "Workout_" + session[:user_id].to_s + "_" + Time.now.to_s
    puts("!"*100)
    puts(workout_name)


    @tasks = []
    @workouts.each do |workout|
      @current_tasks = workout.task
      @current_tasks.each do |t|
        @tasks.append(t)
      end
    end
    @tasks = [] if (Task.all.nil?)
    
    @exercise_sets = []
    @tasks.each do |task|
      @current_exercise_sets = task.exercise_set
      @current_exercise_sets.each do |e|
        if (e.completed)
          @exercise_sets.append(e)
        end
      end
    end
    @exercise_sets = [] if (ExerciseSet.all.nil?)
    
  end
  
  def process_new_quick_log
    puts("Creating new quick log...")
    puts("="*100)
    user = current_user
    workout_name = "Workout_" + current_user.id.to_s + "_" + Time.now.to_s
    task_card_data = params[:task_card_data]
    Workout.insert_new_workout(user, workout_name, task_card_data, true, true, true)
    head :ok, content_type: "text/html"
  end
  
end
