FactoryBot.define do
    factory :user do
        @new_user = Faker::Omniauth.unique.google
        uid { Faker::Number.unique.number(5) }
        provider { @new_user.provider }
        name { @new_user.name }
        oauth_token { @new_user.credentials.token }
        oauth_expires_at { @new_user.credentials.expires_at }
    end
end