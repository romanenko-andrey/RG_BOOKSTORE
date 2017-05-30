FactoryGirl.define do
  factory :book do
    transient do
      number_of_authors { rand(1..3) }
      number_of_photos 1
    end

    name              { FFaker::Book.title }
    description       { FFaker::DizzleIpsum.paragraphs }
    short_description { FFaker::CheesyLingo.sentence }
    price             { FFaker.numerify('#.##') }
    dimensions        { "H:#{FFaker.numerify('#.#')}\" x W:#{FFaker.numerify('#.#')}\" x D:#{FFaker.numerify('#.#')}\"" }
    public_year       { Date.new(2017 - rand(10)) }
    materials         { FFaker::Lorem.words.join ', ' }
    authors           { FactoryGirl.create_list :author, number_of_authors }
    photos            { FactoryGirl.create_list(:photo, number_of_photos) }
  end
end
