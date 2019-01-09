require 'factory_bot'
describe "Login Tests" do
    it "A new user creates a new user row" do
      new_user = FactoryBot.build(:user)
      auth = OmniAuth.config.add_mock(provider.to_sym, {:uid => new_user.uid, :provider => new_user.provider, :info => {:name => new_user.name}, :credentials => {:token => new_user.oauth_token, :expires_at => new_user.oauth_expires_at}})
      expect {
        User.from_omniauth(auth)
      }.to change{User.count}.by(1)
    end
end