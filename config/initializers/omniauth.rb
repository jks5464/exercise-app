OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '812103217807-vh3o74lbajgcujtt8jc6ojcsdblttql0.apps.googleusercontent.com', 'NXR9Lqn0dDx-ITbAQF31SOXT', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
