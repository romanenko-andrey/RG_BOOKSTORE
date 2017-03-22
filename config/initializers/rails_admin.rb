RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  config.parent_controller = 'ApplicationController'

  config.actions do
    dashboard  
    index     
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    state
  end

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
      fields :number, :created_at, :user
      field :status, :state
    end

    edit do
      field :status, :state
      fields :number, :user, :discont, :total_cost, :delivery_methods, :delivery_cost
    end

    state({ states: {
      in_progress: 'btn-info',
      in_queue:    'btn-warning',
      in_delivery: 'btn-warning',
      delivered:   'btn-success',
      canceled:    'btn-danger' } 
    })

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

    list do
      fields :text, :rating, :book, :created_at, :user
      field  :status, :state
      field  :verified
    end

    edit do
      field  :status, :state
      fields :title, :text, :rating, :book, :created_at, :user
    end

    state({
      states: {
        unprocessed: 'btn-warning',
        rejected:    'btn-danger',
        approved:    'btn-success' }
    })
  end

  config.model 'Author' do
    object_label_method do
      :full_name_method
    end
  end

  def photo_url_method
    file_identifier.to_s
  end

  def user_show_method
    email.to_s
  end

  def note_show_method
    "#{status} from #{user.email}"
  end

  def full_name_method
    "#{first_name} #{last_name}"
  end
end
