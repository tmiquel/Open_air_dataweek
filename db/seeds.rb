# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true

Rails.application.eager_load!
models_array = [User, Topic, Dataset, DatasetCollection]
# Sets the locale to "France":
Faker::Config.locale = 'fr'

puts
puts "*"*50
puts "Open Air Seed"
puts "*"*50
puts
puts "Deleting Database for the following models: #{models_array.join(' ')}."
puts '-' * 50
puts
models_array.each(&:destroy_all)
Faker::UniqueGenerator.clear
puts 'Done'
puts
puts 'Reinitiating tables index at  1'
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

models_items_count = Hash[[['User', 5], ['Topic', 9], ['Dataset', 15], ['DatasetCollection', 12]]]
topics_pics_paths_array = Rails.env.production? ? Dir.glob(Rails.root.join("public", "assets", "air-quality", "*.jpg")) :
 Dir.glob(Rails.root.join("app", "assets", "images", "air-quality", "*.jpg")) 

topic_driver_text = "Ceci est une introduction pour la section Driver de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_pressure_text =  "Ceci est une introduction pour la section Pressure de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_state_text = "Ceci est une introduction pour la section State de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_impact_text = "Ceci est une introduction pour la section Impact de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_response_text = "Ceci est une introduction pour la section Response de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_count =  0
models_array.each do |model|
  puts
  puts "Generating #{models_items_count[model.name]} items for #{model.name}"
  models_items_count[model.name].times do
    case model.name
    # when 'City'
    #   model.create(name: Faker::Nation.capital_city,
    #                zip_code: Faker::Number.number(5).to_s)

    when 'User'
			if (User.all.size == models_items_count[model.name] - 1)
				User.create(first_name: "Had", last_name: "Minh", email: "admin@admin.com", password: "AdminAdmin", is_admin: true)
                puts "The password of User admin@admin.com is AdminAdmin (admin rights)"
			else
				password = Faker::Internet.password(13, 25, true, true)
				email = Faker::Internet.unique.email

				puts "The password of User #{email} is #{password}"

				model.create(first_name: Faker::Name.first_name,
										 last_name: Faker::Name.last_name,
										 email: email,
										 password: password,
										 password_confirmation: password)
			end
    when 'Topic'
      if topics_pics_paths_array.size == 0
        puts
        puts "Issue: Unsufficient number of pics to generate the required amount (#{models_items_count[model.name]}) of topic items"
        puts

      else
        unless topic_count == 0        
          my_topic = model.new(title: Faker::Lorem.paragraph_by_chars(50, false),
                        short_description: Faker::Lorem.paragraph_by_chars(256, false),
                        driver_section_title: 'Besoins socio-économiques', 
                        driver_section_intro: topic_driver_text,
                        pressure_section_title: 'Emissions',
                        pressure_section_intro: topic_pressure_text,
                        state_section_title: 'Etats', 
                        state_section_intro: topic_state_text, 
                        impact_section_title: 'Impacts', 
                        impact_section_intro: topic_impact_text, 
                        response_section_title: 'Réglementations',
                        response_section_intro: topic_response_text)
          my_topic.main_picture.attach(io: File.open(topics_pics_paths_array.pop), filename: ('picture ' + my_topic.title.to_s + '.jpg'))
        else
          #Maritime topic 
          my_topic = model.new(title: "L'impact des zones portuaires sur la qualité de l'air",
                        short_description: "La pollution d’origine maritime s’intègre dans la pollution générale de la zone portuaire qui comprend aussi la pollution secondaire aux infrastructures, en particulier de transport routier nécessaire au port et la pollution propre à la ville, transport routier, chauffage, etc.
Pour Marseille, par exemple, cette pollution maritime représente 5 à 10 pourcents de la pollution totale.",
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
		when 'DatasetCollection'
			while true
      	dataset_collection = model.new(user: User.all.sample, dataset: Dataset.all.sample)
				break if dataset_collection.save
			end

    when 'Dataset'
      if Dataset.all.size  > 7  #once we have created datasets linked to Topic.first - Maritime pollution
        FactoryBot.create(:dataset) if Dataset.all.size < models_items_count[model.name]
      else
       #Maritime_port_dataset
          model.create(
            topic: Topic.first,
            title: 'Synthèse des drivers économiques',
            db_link: 'https://trouver.datasud.fr/dataset/indicateur-de-contexte-du-tableau-de-bord-regional-du-developpement-durable/resource/42bceea5-a110-47e2-baed-b0b4499f9bf2/view/fb69d6f0-2cae-46aa-9db7-dbf887bf7d29',
            dpsir_category: 'Driver',
            description: 'Liste des 8 indicateurs de contexte ( un par feuillet du tableur) :
Tableau 1 : Population totale
Tableau 2 : Indice de vieillissement (rapport des 65 ans et plus/moins de 20 ans)
Tableau 3 : Part des moins de 20 ans dans la population
Tableau 4 : Espérance de vie à la naissance des hommes
Tableau 5 : Espérance de vie à la naissance des femmes
Tableau 6 : PIB par habitant
Tableau 7 : Nombre d’établissements SEVESO pour 1000 km2
Tableau 8 : Part des superficies en sites « Natura 2000 »',
            rendered: true,
            file_type: 'xls')

            #do not render
            model.create(
            topic: Topic.first,
            title: 'Activité maritime',
            db_link: 'https://trouver.datasud.fr/dataset/les-lignes-maritimes-regulieres-touchant-le-port-de-marseille-fos/resource/57223ded-43ca-493c-8831-378aace9a8ef/view/20052ead-ee6c-4c31-a159-9dff67bdf7e4',
            dpsir_category: 'Driver',
            description: '55 services maritimes réguliers relient le Port de Marseille-Fos à plus de 500 autres ports et desservent près de 160 pays dans le monde. ',
            rendered: false,
            file_type: 'pdf')


           model.create(
            topic: Topic.first,
            title: "Emissions de polluants des EPCI (Intercommunalités) tous secteurs d'activité confondus dans la région Sud",
            db_link: "https://trouver.datasud.fr/dataset/emissions-de-polluants-atmospheriques-tous-secteurs-dactivite-confondus-des-epci-de-la-region-sud/resource/54515d61-8274-40a4-93d2-6b4e64387307/view/9f6b117c-badf-4d0e-a11a-206122277194",
            dpsir_category: 'Pressure',
            description: "Estimation des émissions annuelles totales des principaux polluants atmosphériques (SO2 - NOx équivalent NO2 - particules en suspension PM10 - particules en suspension PM2.5 - benzène C6H6 - Composés Organiques Volatils Non Méthaniques COVNM - Ammoniac NH3 - monoxyde de carbone CO - As - Cd - Ni - Pb – BaP sur la région Sud pour l'année 2016. Toutes les données fournies sont kg. Le nombre de décimales varie en fonction du polluant.",
            rendered: true,
            file_type: 'xls'
            )

            #kind: qml, do not render...
            model.create(
            topic: Topic.first,
            title: "Évolution de l'occupation du sol en Provence-Alpes-Côte d'Azur entre 2006 et 2014 ",
            db_link: 'https://trouver.datasud.fr/dataset/evolution-de-loccupation-du-sol-en-provence-alpes-cote-dazur-entre-2006-et-2014/resource/78256182-39b7-4938-a6ae-e08a6fa54788',
            dpsir_category: 'State',
            description: "Cartographie de l'occupation des sols de la Région PACA en 2006, réalisée par traitement d'images satellitaires, d'après la nomenclature européenne CORINE Land Cover, adaptée aux spécificités régionales.",
            rendered: false,
            file_type: 'map')
          

          #map, do not render#map, do not render
            model.create(
            topic: Topic.first,
            title: "Modélisations annuelles des polluants principaux sur la région Sud ",
            db_link: 'https://trouver.datasud.fr/dataset/niveaux-annuels-de-polluants-dans-l-air-ambiant-issus-de-la-modelisation-sur-la-region-sud',
            dpsir_category: 'State',
            description: "Niveaux annuels des polluants dioxyde d’azote NO2, particules en suspension PM10, ozone O3 et de l'Indice Synthétique air (ISA) dans l'air ambiant, issus de la modélisation de la région Sud par année sur les 5 dernières années. Toutes les données fournies sont en μg/m³ (microgramme par mètre cube). Statistiques selon la réglementation en vigueur pour chaque polluant :

    - PM10 : 36e moyenne journalière la plus élevée. Unité : microgramme par mètre-cube (µg/m3).
    - PM10 : moyenne annuelle. Unité : microgramme par mètre-cube (µg/m3).
    - PM2.5 : moyenne annuelle. Unité : microgramme par mètre-cube (µg/m3).
    - NO2 : moyenne annuelle. Unité : microgramme par mètre-cube (µg/m3).
    - O3 : 26e maximum journalier de la moyenne sur 8h le plus élevé. Unité : microgramme par mètre-cube (µg/m3).
    - ISA : indice non réglementaire cumulant les concentrations annuelles de NO2, PM10 et O3 normalisées par leurs lignes directrices OMS respectives. Valeurs sans unité, variations habituelles entre 0 et 100.

Donnée créée avec un modèle de dispersion atmosphérique à l'échelle locale (ADMS Urban). Utilisation de l'inventaire des émissions de la région Sud. Statistiques comparables aux valeurs limites pour la protection de la santé : Décrets N°98-360, 2002-213, 2003-1085, 2007-1479, 2008-1152, 2010-1250 et Directive 2008/50/CE. Modélisation réalisée conformément aux recommandations du référentiel métier du Laboratoire Central de Surveillance de la Qualité de l’Air (LCSQA).

La résolution est de 25 m pour toute les couches, sauf celles pour l'ozone qui sont à 1 km.
",
            rendered: false,
            file_type: 'map')
          
            #map, do not render
            model.create(
            topic: Topic.first,
            title: "Mesures horaires de polluants",
            db_link: 'https://trouver.datasud.fr/dataset/concentrations-horaires-de-polluants-dans-lair-ambiant-issues-du-reseau-permanent-de-mesures-automa/resource/99680cee-3efe-439f-bb60-f99e25537779',
            dpsir_category: 'State',
            description: "Concentrations moyennes horaires issues du réseau fixe des mesures européennes des principaux polluants réglementés dans l'air sur la région Sud : dioxyde de soufre SO2, monoxyde d'azote NO et dioxyde d'azote NO2, particules en suspension PM10, particules en suspension PM2.5, ozone O3, benzène C6H6, monoxyde de carbone CO. Toutes les données fournies sont en μg/m³ (microgramme par mètre cube) sauf CO (mg/m³).",
            rendered: false,
            file_type: 'map')
          
            #map, do not render
            model.create(
            topic: Topic.first,
            title: "Exposition aux PM2,5",
            db_link: 'https://trouver.datasud.fr/dataset/populations-et-territoires-exposes-au-depassement-des-valeurs-limites-sur-la-region-sud/resource/77c2d91d-5bfb-4911-8db9-d169a4d33b14#bbox=3.8836669916473716,43.46089377519706,5.28991699145153,44.645208218791495',
            dpsir_category: 'Impact',
            description: "Populations et territoires exposés au dépassement des valeurs limites des PM10 et NO2 sur la région Sud pour les 5 dernières années.
En complément, sont diffusés également les chiffres d'exposition pour d'autres valeurs de référence (valeurs cibles et lignes directrices OMS).
",
            rendered: false,
            file_type: 'map')


            # xls, pdf, do not render
            model.create(
            topic: Topic.first,
            title: "Lutte contre le changement climatique et protection de l'atmosphère : Indicateurs de développement durable ",
            db_link: 'https://trouver.datasud.fr/dataset/lutte-contre-le-changement-climatique-et-protection-de-latmosphere-indicateurs-de-developpement-dur',
            dpsir_category: 'Response',
            description: "Ce tableau de bord du développement durable a pour objectif d’éclairer la prise de décision et la mise en œuvre d’actions permettant de répondre aux défis auxquels la région Provence-Alpes-Côte d’Azur est confrontée. Ce diagnostic annuel de l’état du développement durable en région a vocation à alimenter les projets territoriaux de planification comme l’Agenda 21 régional, le Schéma régional d’aménagement et de développement durable du territoire, etc..",
            rendered: false,
            file_type: 'map')

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

puts "*"*80
puts
puts "Please note you have an Admin Access (required for the Content Writer Dashboard): "
puts "login > admin@admin.com"
puts "password > AdminAdmin"
puts
puts "*"*80 
