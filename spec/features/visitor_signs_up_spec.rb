# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Bienvenue ! Vous vous êtes bien enregistré(e).')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Créer un compte')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Créer un compte')
  end

  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Thibaut'
    fill_in 'user_last_name', with: 'Miquel'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password

    click_button 'Inscription'
  end
end
