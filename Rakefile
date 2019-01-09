# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

task :hello_message do
    puts("Starting default tasks#{'-'*50}")
end

task :goodbye_message do
    puts("Finished with default tasks#{'-'*50}")
end

# task :default => [:hello_message, "db:migrate", :goodbye_message]

Rails.application.load_tasks

