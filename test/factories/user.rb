FactoryBot.define do
    factory :user do
        new_user = Faker::Omniauth.google
        uid { Faker::Number.unique.number(5) }
        provider { "google_oauth2" }
        name { new_user[:name] }
        oauth_token { new_user[:credentials][:token] }
        oauth_expires_at { 0 }
    end
end