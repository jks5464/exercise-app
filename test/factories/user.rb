FactoryBot.define do
    factory :user do
      ignore do
        uid '1234'
        provider 'google_oauth2'
      end
     
      after(:create) do |user, evaluator|
        FactoryBot.create :auth_provider, :user => user, :uid => evaluator.uid, :name => evaluator.provider
      end
    end
     
    factory :auth_provider do
    end
end