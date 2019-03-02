class MeasurementsController < AuthenticationController
  
  public
  
  def is_number?(string)
    true if Float(string) rescue false
  end
  
  def is_number_or_blank?(m)
    return ((is_number?(m) and Float(m) >= 0.0 and m.to_s.split("").size  <=5) or m == "")
  end
  
  def valid_measurements?(measurements)
    has_a_number = false
    measurements.each do |value|
      if !is_number_or_blank?(value) then
        return false
      end
      if is_number?(value) then
        has_a_number = true
      end
    end
    
    return has_a_number
  end
  
  def new
  end

  def my_measurements
    puts("Displaying my measurements page")
    puts("User has id: #{session[:effective_id]}")
    @measurements = Measurement.where(user_id: session[:effective_id])
    @measurements = [] if (@measurements.nil?)
  end
  
  def enter_my_measurements
    puts("Displaying enter my measurements page")
  end
  
  def process_enter_new_measurements
    puts("Inserting new mesaurements to database...")
    weight = params[:weight]
    body_fat = params[:body_fat]
    height = params[:height]
    
    if valid_measurements?([weight, body_fat, height]) then
      Measurement.create(user_id: session[:effective_id], height: height, weight: weight, body_fat: body_fat)  
    else
      flash[:error] = "Invalid measurements"
    end
    
    redirect_to my_measurements_path
  end 
  
  def process_update_measurements
    new_measurements = params[:new_measurements]
    status = 200
    message = ""
    # validate all measurements
    new_measurements.each do | i, m |
      if !valid_measurements?([m["weight"].to_i, m["body_fat"].to_i, m["height"].to_i]) then
        status = 500
        message = "Invalid measurements: #{m["weight"].to_i}, #{m["body_fat"].to_i}, #{m["height"].to_i}"
      end
    end
    
    # update valid measurements
    new_measurements.each do | i, m |
      Measurement.update_measurment(m["id"], m["weight"].to_i, m["body_fat"].to_i, m["height"].to_i)
    end
    
    
    render json: { status: status, message: message }
  end
end
