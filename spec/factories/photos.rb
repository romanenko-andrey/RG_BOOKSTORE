FactoryGirl.define do
  factory :photo do
    file do
      image_path = Rails.root.join('db', 'seeds_img', '1.jpg')
      Rack::Test::UploadedFile.new(image_path)
    end
  end
end
