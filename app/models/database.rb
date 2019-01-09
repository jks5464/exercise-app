class Database

  attr_accessor :measurements
  attr_accessor :exercises
  attr_accessor :workouts

  def initialize
    @measurements = Array.new
    @exercises = Array.new
    @workouts = Array.new
  end

  def process_enter_new_measurements(weight, body_fat, height)
    @measurements.push([weight, body_fat, height])
  end
  
  def process_create_workout(name)
    @workouts.push([name])
  end
  
  def process_create_exercise(name, category, description)
    @exercises.push([name, category, description])
  end

end
