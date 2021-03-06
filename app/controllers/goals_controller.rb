class GoalsController < AuthenticationController
  public
  
  def valid_user_id?(user_id)
    !User.where(id: user_id).empty?
  end
  
  def valid_name?(name)
    return (name.length <= 20)
  end
  
  def valid_exercise?(exercise)
    !Exercise.where(name: exercise).empty?
  end
  
  def valid_unit?(unit)
    !Unit.where(name: unit).empty?
  end
    
  def valid_description?(description)
    return (description.length <= 120)
  end
  
  def valid_value?(value)
    return (value[/[0-9]+/] == value)
  end
  
  def valid_date?(date, format="%Y-%m-%d")
    Date.strptime(date, format) rescue return (false)
    return (true)
  end

  def valid_goal?(user_id, exercise, unit, name, description, value, date)
    return (valid_user_id?(user_id) and
            valid_exercise?(exercise) and 
            valid_unit?(unit) and 
            valid_name?(name) and 
            valid_description?(description) and 
            valid_value?(value) and 
            valid_date?(date))
  end
  
  def create_goal(user_id, exercise, unit, name, description, value, date)
    exercise_id = Exercise.where(name: exercise).first.id
    unit_id = Unit.where(name: unit).first.id
    Goal.create(user_id: user_id, exercise_id: exercise_id, unit_id: unit_id, name: name, description: description, value: value, created_at: date)
  end
  
  def new
  end
  
  def show
    puts("showing the progress")
  end

  def my_goals
    puts("displaying my goals")
    @goals = current_effective_user.goal
    @exercises = Exercise.all
  end
  
  def homepage
    puts("go back to the homepage")
  end
  
  def enter_goal
    puts("displaying enter goal")
    @exercises = Exercise.all
    @units = Unit.all
    
    # user.workouts.exercise.tasks.exercise_sets
  end
    
  def enter_goal_create
    puts("entering new goal into database")
    user_id = session[:effective_id]
    exercise = params[:exercise]
    unit = params[:unit]
    name = params[:name]
    description = params[:description]
    value = params[:value]
    date = params[:date]
    
    if valid_goal?(user_id, exercise, unit, name, description, value, date) then
      create_goal(user_id, exercise, unit, name, description, value, date)
      redirect_to my_goals_path
    else
      flash[:error] = "Invalid goal"
      redirect_to enter_goal_path
    end
  end
  
  def process_delete_goal
    goal_id = params[:goal_id]
    
    Goal.delete_goal(goal_id)
    
    render json: { status: 200 }
  end
  
  def process_update_goals
    new_goals = params[:new_goals]
    new_goals = [] if (new_goals.nil?)
    
    # update valid measurements
    new_goals.each do | i, g |
      goal = Goal.find(g["goal_id"])
      goal.update(name: g["name"],
                  description: g["description"],
                  exercise_id: g["exercise_id"],
                  value: g["value"],
                  unit_id: g["unit_id"])
    end
    
    render json: { status: 200 }
  end
end
