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
    
    Exercise.create(uid: session[:user_id], name: name, category: category)
  
    redirect_to create_workout_path
  end
  
end
