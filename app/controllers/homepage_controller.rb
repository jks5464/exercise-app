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
    new_workout = Workout.create("name": workout_name, "user_id": session[:user_id], "completed": "true")
    @workouts.append(new_workout)

    puts("All the things!")
    puts("*"*100)
    t_tmp2 = Task.create("exercise_id": "2", "completed": "true", "workout_id": new_workout.id)
    ExerciseSet.create("rep_count": "25", "rep_value": "30", "rep_unit": "lbs", "completed": "true", "task_id": t_tmp2.id)


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
  
end
