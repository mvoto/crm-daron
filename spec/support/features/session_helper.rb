module Features
  module SessionHelpers

    # If this starts getting too slow, then you should try this:
    # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
    def sign_in
      @user = build(:user)
      @user.confirmed_at = Time.now
      @user.save
      login_as(@user, :scope => :user, :run_callbacks => false)
    end
  end
end
