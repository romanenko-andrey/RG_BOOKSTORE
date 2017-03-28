# rake db:migrate RAILS_ENV=test
# load Rails.root.join('db', 'test_seeds.rb')

%w(User Photo Book Review Bestseller Newest Author Category Country Order Coupon).each do |database|
  eval("#{database}.destroy_all")
end

Category.create! [
  { name: 'Mobile development' },
  { name: 'Photo' },
  { name: 'Web design' },
  { name: 'Database' }
]

Country.create! [
  { name: 'USA', zip: '00' },
  { name: 'Canada', zip: '01' },
  { name: 'Mexica', zip: '02' },
  { name: 'Ukraine', zip: '38' }
]

User.create! [{ name: 'Admin', admin: true, email: 'admin@test.com',
                password: '12345678', password_confirmation: '12345678' }]

User.first.billing_address.update(FactoryGirl.attributes_for(:billing_address))

User.first.shipping_address.update(FactoryGirl.attributes_for(:shipping_address))

FactoryGirl.create :coupon

Category.find_each do |category|
  FactoryGirl.create_list(:book, 1, category: category)
end

Book.find_each do |book|
  FactoryGirl.create_list(:review, rand(0..2), book: book, user: User.first)
end

Book.take(3).each { |book| Newest.create! book: book }

Book.take(4).each { |book| Bestseller.create! book: book }

5.times { FactoryGirl.create :order, user: User.first }
