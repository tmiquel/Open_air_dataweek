FactoryBot.define do
  factory :user do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password { "foo_bar" }    
		adress { "25, Avenue des oliviers, 13200, Provence, France" }
  end
end
