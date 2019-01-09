class GoalsController < AuthenticationController
  public
  
  def valid_user_id?(user_id)
    User.where(id: user_id) rescue return (false)
    return (true)
  end
  
  def valid_name?(name)
    return (name.length <= 20)
  end
  
  def valid_exercise?(exercise)
      Exercise.where(name: exercise) rescue return (false)
      return (true)
  end
  
  def valid_unit?(unit)
    Unit.where(name: unit) rescue return (false)
    return true
  end
    
  def valid_description?(description)
    return (description.length <= 120)
  end
  
  def valid_value?(value)
    return (value[/[0-9]+/] == value)
  end
  
  def valid_date?(date, format="%m/%d/%Y")
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
    exercise_id = Exercise.where(name: exercise)
    unit_id = Unit.where(name: unit)
    Goal.create(user_id: user_id, exercise_id: exercise_id, unit_id: unit_id, name: name, description: description, value: value, date: date)
  end
  
  def new
  end
  
  def show
    puts("showing the progress")
  end

  def my_goals
    puts("displaying my goals")
  end
  
  def homepage
    puts("go back to the homepage")
  end
  
  def enter_goal
    puts("displaying enter goal")
  end
  
  def enter_goal_create
    puts("entering new goal into database")
    user_id = session[:uid]
    exercise = params[:exercise]
    unit = params[:unit]
    name = params[:name]
    description = params[:description]
    value = params[:value]
    date = params[:date]
    
    if valid_goal?(user_id, exercise, unit, name, description, value, date) then
      create_goal(user_id, exercise, unit, name, description, value, date)
    else
      flash[:error] = "Invalid measurements"
    end
    
    redirect_to my_goals_path
  end
end