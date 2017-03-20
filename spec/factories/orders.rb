FactoryGirl.define do
  factory :order do
    sequence :number do |n|
      "R#{n.to_s.rjust(8, '0')}"
    end

    # number           { generate :number }
    discont          { FFaker.numerify('#.##') }
    orders_state     { OrdersState.offset(rand(0..4)).take(1).first }
    delivery_methods { 'Delivery Next Day!' }
    delivery_cost    { FFaker.numerify('##.##') }
    total_cost       { FFaker.numerify('###.##') }
    cvv              { FFaker.numerify('###') }
    mmyy             { FFaker.numerify('##/##') }
    card_number      { FFaker.numerify('#### #### #### ####') }
    card_name        { FFaker::Name.name }
    items            { [{ book_id: Book.first.id, price: Book.first.price, sum: rand(1..3) }] }
  end
end