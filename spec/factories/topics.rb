FactoryBot.define do
  factory :topic do
  	title {Faker::Lorem.paragraph_by_chars(50, false)}
	  short_description {Faker::Lorem.paragraph_by_chars(256, false)}
	  highlighted_category {'State'}
	  driver_section_title {'Besoins socio-économiques'} 
	  driver_section_intro {Faker::Lorem.paragraph_by_chars(256, false)}
	  pressure_section_title {'Emissions'}
	  pressure_section_intro {Faker::Lorem.paragraph_by_chars(256, false)}
	  state_section_title {'Etats'}
	  state_section_intro {Faker::Lorem.paragraph_by_chars(256, false)}
	  impact_section_title {'Impacts'} 
	  impact_section_intro {Faker::Lorem.paragraph_by_chars(256, false)}
	  response_section_title {'Réglementations'}
	  response_section_intro {Faker::Lorem.paragraph_by_chars(256, false)}



	# cf https://blog.eq8.eu/til/factory-bot-trait-for-active-storange-has_attached.html	  
    trait :with_main_picture do
	    main_picture { 
	    	fixture_file_upload(
	    	Rails.root.join('spec', 'support', 'assets', 'test-image.png'),
	    	 'image/png') 
			}

    end
  end
end