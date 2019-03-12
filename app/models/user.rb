class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	validates :first_name, presence: true, length: { maximum: 45 }
	validates :last_name, presence: true, length: { maximum: 45 }
	validates :adress, presence: true, length: { minimum: 15, maximum: 200 }

	def full_name
		"#{self.first_name} #{self.last_name}"
	end

end
