RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # == Cancan ==
  config.authorize_with :cancan

  config.parent_controller = 'ApplicationController'

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

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
  end

  #config.label_methods = [:to_s].concat(config.label_methods)
  #config.label_methods << :id

  config.model 'User' do
    object_label_method :user_show_method

    navigation_label 'Users data'
    exclude_fields :reset_password_sent_at,
                   :remember_created_at,
                   :password_confirmation,
                   :password
  end

  config.model 'BillingAddress' do
    parent User
  end
  config.model 'ShippingAddress' do
    parent User
  end

  config.model 'Book' do
   
    nested do
      field :photos
      field :notes
    end
  end

  config.model 'Order' do
   
    list do
      sort_by :user

      fields :number, :created_at, :user, :orders_state
    end

    # state({ states: {
    #   processing: 'btn-info',
    #   in_progress: 'btn-primary',
    #   in_transit: 'btn-warning',
    #   delivered: 'btn-success',
    #   canceled: 'btn-danger' } })
  end

  config.model 'Photo' do
    object_label_method do
      :photo_url_method
    end
  end

  config.model 'Review' do
    object_label_method do
      :note_show_method
    end
  end

  config.model 'Author' do
    object_label_method do
      :full_name_method
    end
  end

  def photo_url_method
    "#{self.file_identifier}"
  end

  def user_show_method
    "#{self.email}"
  end

  def note_show_method
    "#{self.status} from #{self.user.email}"
  end

  def full_name_method
    "#{self.first_name} #{self.last_name}"
  end
end
