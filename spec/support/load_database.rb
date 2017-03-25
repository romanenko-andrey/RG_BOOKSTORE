module Support
  module LoadDataBase
    def initialisation_bookstore
      load Rails.root.join('db', 'test_seeds.rb')
    end
  end
end