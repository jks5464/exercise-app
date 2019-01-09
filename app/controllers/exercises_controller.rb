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
    description = params[:description]
    
    if valid_exercises?([name, category, description]) then
      Exercise.create(uid: session[:user_id], name: name, category: category, description: description)
    else
      flash[:error] = "Invalid exercise input"
    end
    
    redirect_to create_workout_path
  end
  
  def valid_exercises?(exercises)

    exercises.each_with_index do |value, index|
    
      # This all checks logic for the name
      if index == 0
        # Returns false if name is an integer 
        if (value.is_a?(Integer) == true)
          return false
          
        # Returns false if name is blank
        elsif value == ""
          return false
        
        # Returns false if the exercise already exists
        elsif Exercise.exists?(name: value)
          return false
          
        # Returns true if the name only includes letters, spaces, and hyphens
        elsif /\A[a-z\-\ ]+/i.match(value)
          return true
          
        else
          return false
        end
      end
    end
  end
end
