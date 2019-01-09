class ExercisesController < ApplicationController

  before_action :get_db_from_session
  after_action  :store_db_in_session
  
  private
  
  def get_db_from_session

    @db = Database.new()
    
    if !session[:db].blank?
      @db = YAML.load(session[:db])
    end
  end

  def store_db_in_session

    session[:db] = @db.to_yaml
  end
  
  public
  
  def new
  end
  

  def homepage
    puts("Go back to the homepage")
  end
  
  def create_exercise
    puts("Displaying create exercise page")
  end
  
  def process_create_exercise
    puts("Inserting new exercise to database...")
    name = params[:name]
    category = params[:category]
    
    @tmp = Exercise.create(name: name, category: category)
    
    if valid_exercises?(@tmp) then
      Exercise.create(uid: session[:user_id], name: name, category: category)
    end
    
    redirect_to create_workout_path
  end
  
  def valid_exercises?(exercises)
    exercise_name = exercises[0]
    
    # Returns false if name is an integer 
    if (exercise_name.is_a?(Integer) == true)
      return false
      
    # Returns false if name is blank
    elsif exercise_name == ""
      return false
    
    # Returns true if the name only includes letters, spaces, and hyphens
    elsif /\A[a-z\-\ ]+/i.match(exercise_name)
      return true
      
    # Returns false if the exercise already exists
    elsif Exercise.where(name: exercise_name)
      return false
      
    else
      return false
    end
  end
end
