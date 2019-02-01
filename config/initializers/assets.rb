Rails.application.configure do
    Rails.application.config.assets.precompile += %w[
        create_workout.js
        search_exercises.js
        quick_log.js
    ]
end