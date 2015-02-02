module Features
  module SessionHelpers

    # If this starts getting too slow, then you should try this:
    # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
    def sign_in
      @user = create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Senha', with: @user.password
      click_button 'Entrar'
      expect(page).to have_content('Logado com sucesso')
    end
  end
end
