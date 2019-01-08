class GoalsController < ApplicationController

  before_action :get_db_from_session
  # after_action  :store_db_in_session
  
  private
  def get_db_from_session

    @db = Database.new()
    if !session[:db].blank?
      @db = YAML.load(session[:db])
    end
  end

  public
  
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
  
end
