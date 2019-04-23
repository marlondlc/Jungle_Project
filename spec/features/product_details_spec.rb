require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  #pending "add some scenarios (or delete) #{__FILE__}" # this can be deleted / purpose: the test might not be running up to date "still developing test"

  # SETUP
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

  scenario "click on products" do
  #within which page "hompage: this example localhost:3000"
  visit "/"

  # DEBUG / VERIFY
  find('.btn.btn-default.pull-right', match: :first).click
  sleep 2
  save_screenshot 'product_clicked.png'

  expect(current_path).to eq "/products/10"
  #expect(page.current_path).to eq '/products/1'
  #expect(current_path).redirect_to "/projects/1"
  #expect(response).to redirect_to '/products/1'
  #expect(respond_to).to redirect_to('localhost:3000/products/1')
  #expect(respond_to).to redirect_to('http://localhost:3000/products/1')
  #expect(page.current_path).to eq 'http://localhost:3000/products/1'
  #expect(page).to eq 'http://localhost:3000/products/1'
  #expect(page).to redirect_to 'http://localhost:3000/products/1'
  #expect(page).to redirect_to ('http://localhost:3000/products/1')
  #expect(page).to redirect_to('http://localhost:3000/products/1')
  #expect(page).current_path'http://localhost:3000/products/1'
  #expect(current_url).to eq 'http://localhost:3000/products/1'

  end


end

