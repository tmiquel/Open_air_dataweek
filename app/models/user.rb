class User < ApplicationRecord
	after_create :welcome_send
	before_destroy :goodbye_user
	

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	validates :first_name, presence: true, length: { maximum: 45 }
	validates :last_name, presence: true, length: { maximum: 45 }
	

	def full_name
		"#{self.first_name} #{self.last_name}"
	end

	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end
	
	def goodbye_user
		UserMailer.bye_email(self).deliver_now
	end

	


end
