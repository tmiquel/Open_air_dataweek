# frozen_string_literal: true

class User < ApplicationRecord
  after_create :welcome_send
  before_destroy :goodbye_user
  has_many :dataset_collections

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  validates :first_name, presence: true, length: { maximum: 45 }
  #validates :last_name, presence: true, length: { maximum: 45 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def goodbye_user
    UserMailer.bye_email(self).deliver_now
  end

  def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.first_name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end
end
