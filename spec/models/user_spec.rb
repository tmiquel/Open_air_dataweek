# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe '#first_name' do
      it 'should not be valid without first_name' do
        bad_user = User.create(last_name: 'Doe', email: 'baduser@email.com', password: 'foo_bar')
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe '#last_name' do
      it 'should not be valid without last_name' do
        bad_user = User.create(first_name: 'John', email: 'baduser@email.com', password: 'foo_bar')
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:last_name)).to eq(true)
      end
    end
  end

  context 'public instance methods' do
    describe '#full_name' do
      it 'should return a string' do
        expect(@user.full_name).to be_a(String)
      end

      it 'should return the full name' do
        user_1 = User.create(first_name: 'John', last_name: 'Doe', email: 'user@email.com', password: 'foo_bar')
        expect(user_1.full_name).to eq('John Doe')
        user_2 = User.create(first_name: 'Jean-Michel', last_name: 'Durant', email: 'user@email.com', password: 'foo_bar')
        expect(user_2.full_name).to eq('Jean-Michel Durant')
      end
    end
  end
end
