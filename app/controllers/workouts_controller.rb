<<<<<<< HEAD
class WorkoutsController < AuthenticationController
  
=======
<<<<<<< HEAD
class WorkoutsController < ApplicationController

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
  
=======
class WorkoutsController < AuthenticationController
  
>>>>>>> 1c965423878c7737d1c5c5b80f1ab16e58a87be5
>>>>>>> c44e446e353d6f4b8342c594e41eaa5165839741
  public
  
  def new
  end
  
  def homepage
    puts("Go back to the homepage")
  end
  
  def my_workouts
    puts("Displaying my workouts page")
    puts("User has uid: #{session[:user_id]}")
    @workouts = Workout.where(uid: session[:user_id])
    @workouts = [] if (@workouts.nil?)
  end
  
  def create_workout
    puts("Displaying create workout page")
    puts("Displaying list of exercises")
    @exercises = Exercise.where(uid: session[:user_id])
    @exercises = [] if (@exercises.nil?)
  end
  
  def process_create_workout
    puts("Inserting new workout to database...")
    name = params[:name]
    
    Workout.create(uid: session[:user_id], name: name)
  
    redirect_to my_workouts_path
  end
  
end
