RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==

    config.authorize_with do
    redirect_to main_app.root_path unless (current_user && current_user.is_admin?)
  end
  

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  #admin's page title
  config.main_app_name = ["Open Air"]

  #change fields label for Articles
  
    config.model 'Topic' do
      label "Articles"
      list do
        field :id
        field :highlighted_category do
          label "catégories"
        end
        field :title do
          label "Titre"
        end
        field :short_description do
          label "description courte"
        end
        field :created_at do
          label "Crée le:"
          date_format :default
        end
        field :updated_at do
          label "Modifié le:"
          date_format :default
        end
      end
      #change fiels in Article's edit page
      
        edit do
          field :highlighted_category do
            label "catégories"
          end
          field :title do
            label "Titre"
            help "Obligatoire - Titre de l'article" 
          end
          field :short_description do
            label "description courte"
            help "Obligatoire - Une description qui s'affichera sur la page des articles"
          end
          field :driver_section_title do
            label "Forces: titre"
            help "Obligatoire - Titre pour 'Driver'"
          end
          field :driver_section_intro do
            label "Forces: introduction"
          end
          field :pressure_section_title do
            label "Pressions: titre"
            help "Obligatoire - Titre pour 'Pressure'"
          end
          field :pressure_section_intro do
            label "Pressions: introduction"
          end
          field :state_section_title do
            label "État: titre"
            help "Obligatoire - Titre pour 'State'"
          end
          field :state_section_intro do
            label "État: introduction"
          end
          field :impact_section_title do
            label "Impacts: titre"
            help "Obligatoire - Titre pour 'Impact'"
          end
          field :impact_section_intro do
            label "Impacts: introduction"
          end
          field :response_section_title do
            label "Réponses: titre"
            help "Obligatoire - Titre pour 'Response'"
          end
          field :response_section_intro do
            label "Réponses: introduction"
          end
          field :main_picture do
            label "Photo pricipale"
          end
          field :datasets
        end
    end

    #change fields label for Datasets
  
    config.model 'Dataset' do
      list do
        field :id
        field :created_at do
          label "Crée le:"
          date_format :default
        end
        field :updated_at do
          label "Modifié le:"
          date_format :default
        end
        field :topic do
          label "Articles"
        end
        field :title do
          label "Titre"
        end
        field :db_link do
          label "Lien BDD"
        end
      end

      #change fiels in dataset's edit page
      
      edit do
        field :topic do
          label "Article"
        end
        field :title do
          label "Titre"
          help "Obligatoire - Titre de l'article" 
        end
        field :db_link do
          label "Lien BDD"
          help "Obligatoire - Lien vers la base de donnée, ex: https://trouver.datasud.fr/dataset/les-lignes-maritimes-regulieres-touchant-le-port-de-marseille-fos"
        end
        field :dpsir_category do
          label "Catégorie DPSIR"
          help "Obligatoire - Driver, Pressure, State, Impact ou Response"
        end
        field :description do
          help "Obligatoire"
        end
        field :dataset_collections
      end
    end





end
