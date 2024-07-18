require "rails_helper"

RSpec.describe "Merchant Show Page", type: :feature do
  before :each do
    @all_merchants = File.read('./spec/fixtures/all_merchants_fixture.json')
stub_request(:get, "http://localhost:3000/api/v1/merchants").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'User-Agent'=>'Faraday v2.10.0'
        }).
      to_return(status: 200, body: @all_merchants, headers: {})

    @merchant_items = File.read('./spec/fixtures/merchant_items_fixture.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1/items").
      with(
        headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Content-Type'=>'application/json',
              'User-Agent'=>'Faraday v2.10.0'
        }).
      to_return(status: 200, body: @merchant_items, headers: {})

    @merchant = File.read('./spec/fixtures/merchant_fixture.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v2.10.0'
            }).
          to_return(status: 200, body: @merchant, headers: {})
  end

  it 'can click on merchant name to go to merchant show page' do
    visit merchants_path

    within("#merchant_list") do
      within("#ID_1") do 
        click_link("Schroeder-Jerde")
      end
    end

    expect(current_path).to eq(merchant_path(1))
  end

  it 'shows merchant name and list of items' do
    visit merchant_path(1)

    expect(page).to have_content("Schroeder-Jerde")
    within("#item_1") do
      expect(page).to have_content("Item Excepturi Rem")
    end
    within("#item_2") do
      expect(page).to have_content("Item Illum Minus")
    end
  end
end