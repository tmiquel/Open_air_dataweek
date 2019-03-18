# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true

Rails.application.eager_load!
models_array = [User, Topic]
# Sets the locale to "France":
Faker::Config.locale = 'fr'

puts "Deleting Database for the following models: #{models_array.join(' ')}."
puts '-' * 50
puts
models_array.each(&:destroy_all)
Faker::UniqueGenerator.clear
puts 'Done'
puts
puts 'Reinitiating tables index at  1'
puts
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
puts '-' * 50
puts
puts 'Done'
puts
puts "Database generation for #{models_array.join(' ')}"
puts '-' * 50
puts

models_items_count = Hash[[['User', 5], ['Topic', 5]]]
topics_pics_paths_array = Rails.env.production? ? Dir.glob(Rails.root.join("public", "assets", "air-quality", "*.jpg")) :
 Dir.glob(Rails.root.join("app", "assets", "images", "air-quality", "*.jpg")) 

topic_driver_text = "Ceci est une introduction pour la section Driver de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_pressure_text =  "Ceci est une introduction pour la section Pressure de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_state_text = "Ceci est une introduction pour la section State de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_impact_text = "Ceci est une introduction pour la section Impact de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_response_text = "Ceci est une introduction pour la section Response de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_count =  0
models_array.each do |model|
  puts "Generating #{models_items_count[model.name]} items for #{model.name}"
  models_items_count[model.name].times do
    case model.name
    # when 'City'
    #   model.create(name: Faker::Nation.capital_city,
    #                zip_code: Faker::Number.number(5).to_s)

    when 'User'
      password = Faker::Internet.password(13, 25, true, true)
      email = Faker::Internet.unique.email

      puts "The password of User #{email} is #{password}"

      model.create(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: email,
                   address: Faker::Address.street_address + " " +
                    Faker::Address.zip_code + " " +
                     Faker::Address.city,
                   password: password,
                   password_confirmation: password)

    when 'Topic'
      if topics_pics_paths_array.size == 0
        puts
        puts "Issue: Unsufficient number of pics to generate the required amount (#{models_items_count[model.name]}) of topic items"
        puts

      else
        unless topic_count == 0        
          my_topic = model.new(title: Faker::Lorem.paragraph_by_chars(50, false),
                        short_description: Faker::Lorem.paragraph_by_chars(256, false),
                        highlighted_category: 'State',
                        driver_section_title: 'Besoins socio-économiques', 
                        driver_section_intro: topic_driver_text,
                        pressure_section_title: 'Emissions',
                        pressure_section_intro: topic_pressure_text,
                        state_section_title: 'Etats', 
                        state_section_intro: topic_state_text, 
                        impact_section_title: 'Impacts', 
                        impact_section_intro: topic_impact_text, 
                        response_section_title:'Réglementations',
                        response_section_intro: topic_response_text)
          my_topic.main_picture.attach(io: File.open(topics_pics_paths_array.pop), filename: ('picture ' + my_topic.title.to_s + '.jpg'))
        else
          #Maritime topic 
          my_topic = model.new(title: "L'impact des zones portuaires sur la qualité de l'air",
                        short_description: "La pollution d’origine maritime s’intègre dans la pollution générale de la zone portuaire qui comprend aussi la pollution secondaire aux infrastructures, en particulier de transport routier nécessaire au port et la pollution propre à la ville, transport routier, chauffage, etc.
Pour Marseille, par exemple, cette pollution maritime représente 5 à 10 pourcents de la pollution totale.",
                        highlighted_category: 'State',
                        driver_section_title: "Fondements économiques du Port", 
                        driver_section_intro: 'Port généraliste et 1er port de France, le Port de Marseille traite tout type de marchandise : hydrocarbures et vracs liquides (pétrole, gaz et produits chimiques), marchandises diverses (conteneurs et autres conditionnements), vracs solides (minerais et céréales).',
                        pressure_section_title: 'Emissions de polluants',
                        pressure_section_intro: 'Ci-dessous figurent une estimation des émissions annuelles totales des principaux polluants atmosphériques (SO2 - NOx équivalent NO2 - particules en suspension PM10 - particules en suspension PM2.5 - benzène C6H6 - Composés Organiques Volatils Non Méthaniques COVNM - Ammoniac NH3 - monoxyde de carbone CO - As - Cd - Ni - Pb – BaP sur la région Sud pour les années 2007, 2012 et 2010 à 2016. Toutes les données fournies sont kg. Le nombre de décimales varie en fonction du polluant.',
                        state_section_title: 'Mesures de pollution', 
                        state_section_intro: "Ci-dessous figurent les niveaux annuels des polluants dioxyde d’azote NO2, particules en suspension PM10, ozone O3 et de l'Indice Synthétique air (ISA) dans l'air ambiant, issus de la modélisation de la région Sud par année sur les 5 dernières années. Toutes les données fournies sont en μg/m³ (microgramme par mètre cube).", 
                        impact_section_title: 'Populations exposées', 
                        impact_section_intro: 'Vous trouverez ici les populations et territoires exposés au dépassement des valeurs limites des PM10, PM2.5 et NO2 sur la région Sud pour les 5 dernières années.', 
                        response_section_title:'Indicateurs pilotes de la Politique Régionale',
                        response_section_intro: "Les 12 indicateurs annuels de Lutte contre le changement climatique et de protection de l'atmosphère ont pour objectif d’éclairer la prise de décision et la mise en œuvre d’actions permettant de répondre aux défis auxquels la région Provence-Alpes-Côte d’Azur est confrontée")

          my_topic.main_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "port-marseille.jpg")), filename: ('port-marseille.jpg'))
        end

        my_topic.save
        topic_count +=  1
      end

  end
end
end




puts 'Done'
puts
puts 'View of the last 3 items for all tables'
puts '-' * 50
puts

models_array.each do |model|
  puts "#{model.name} : #{model.count} items"
  unless models_items_count[model.name] == model.count
    puts "ISSUE of Validation ? the number of generated items differs from the requested one: #{models_items_count[model.name]}"
  end
  puts
  tp model.last(3)
  puts
end


# 10.times do
#   cart = FactoryBot.create(:cart)
# end

# 10.times do
# 	while true
#   	single_cart_pic = FactoryBot.build(:single_cart_pic)
# 		break if single_cart_pic.save 
# 	end
# end

