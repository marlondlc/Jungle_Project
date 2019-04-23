require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "products in cart" do
  #within which page "hompage: this example localhost:3000"
  visit "/"

  # DEBUG / VERIFY
  find('.btn.btn-primary', match: :first).click
  sleep 2
  save_screenshot 'product_in_cart.png'

  expect(page).to have_text "My Cart (1)"
  end

end
