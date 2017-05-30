module Support
  module LoadDataBase
    def bookstore_initialisation
      load Rails.root.join('db', 'test_seeds.rb')
    end
  end
end