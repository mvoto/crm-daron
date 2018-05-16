module Features
  module SessionHelpers

    # If this starts getting too slow, then you should try this:
    # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
    def sign_in
      @user = create(:user)
      login_as(@user, :scope => :user, :run_callbacks => false)
    end
  end
end
