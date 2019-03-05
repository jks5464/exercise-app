class ExercisesController < ApplicationController
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
    name = params[:name].strip
    category = params[:category].strip
    description = params[:description].strip
    
    
    if valid_exercises?([name, category, description]) then
      Exercise.create(user_id: session[:effective_id], name: name, category: category, description: description)
    else
      flash[:error] = "Invalid exercise input"
    end
    
    redirect_to create_workout_path
  end
  
  def process_delete_exercise
    exercise_id = params[:exercise_id]
    Exercise.delete_exercise(exercise_id)
    
    render json: { status: 200 }
  end
  
  def process_update_exercises
    new_exercises = params[:new_exercises]
    new_exercises = [] if (new_exercises.nil?)
    
    new_exercises.each do | i, e |
      exercise = Exercise.find(e["exercise_id"])
      exercise.update(name: e["name"],
                  category: e["category"],
                  description: e["description"])
    end
    
    render json: { status: 200 }
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
