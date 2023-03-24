module ControllerAuth
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user, confirmed_at: Time.now)
      sign_in user
    end
  end
  # def login_user(user)
  #   @request.env["devise.mapping"] = Devise.mappings[:user_confirmed]
  #   sign_in user
  # end
end
