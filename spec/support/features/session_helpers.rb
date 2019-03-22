# frozen_string_literal: true

module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'user_first_name', with: 'Thibaut'
      fill_in 'user_last_name', with: 'Miquel'
      fill_in 'user_address', with: '7 rue Larcourt 13007 Marseille'
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password

      click_button 'Inscription'
    end

    def sign_in
      user = create(:user)
      visit sign_in_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
    end
  end
end
