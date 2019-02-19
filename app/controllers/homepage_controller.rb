class HomepageController < AuthenticationController

  public
  
  def new
  end
  
  def show
    puts("showing the progress")
  end

  
  def dashboard
    puts("dashboard showing")
    
    @data = Goal.day_by_value(current_user)
    
    
    
    @goals = Goal.where(user_id: session[:user_id])
    @goal_data = Array.new
    @goal_names = Array.new
    @goal_progress = Array.new
    @goals.each do |g|
      # byebug
      goal_values = Array.new
      current_user.workout.each do | workout |
        workout.task.each do |task|
          if task.exercise_id == g.exercise_id then
            task.exercise_set.each do | exercise_set |
              goal_values.push(Array.new([exercise_set.created_at.strftime("%B %Y %D"), exercise_set.rep_value]))
            end
          end
        end
      end
    
      rep_values = goal_values.map(&:last)
      @progress = (rep_values.max.to_f/g.value.to_f)*100.to_f
      
      # byebug
      puts "GOAL NAME: "
      puts g.name
      @goal_data.push(goal_values)
      @goal_progress.push(@progress.to_i)
      
      puts "GOAL DATA: "
      puts "#{@goal_data}"
      puts "END GOAL DATA"
      
      puts "PROGRESS: "
      puts "#{@goal_progress}"
      puts "END GOAL PROGRESS"
    end
    @goals = [] if (@goals.nil?)

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
    Workout.insert_new_workout(user, workout_name, task_card_data, true, true, true)
    head :ok, content_type: "text/html"
  end
  
  def view_exercises
    puts("Displaying view exercises page")
    @exercises = Exercise.all
    @units = Unit.all
  end
    
  
end
