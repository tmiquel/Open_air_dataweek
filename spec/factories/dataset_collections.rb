FactoryBot.define do
  factory :dataset_collection do
		user { User.all.sample }
		dataset { Dataset.all.sample }    
  end
end
