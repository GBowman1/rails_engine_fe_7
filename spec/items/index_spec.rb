require "rails_helper"

RSpec.describe "Items Index Page", type: :feature do
  before :each do
    @items = File.read('./spec/fixtures/all_items_fixture.json')

    stub_request(:get, "http://localhost:3000/api/v1/items").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v2.10.0'
            }).
          to_return(status: 200, body: @items, headers: {})

    @item = File.read('./spec/fixtures/item_fixture.json')

    stub_request(:get, "http://localhost:3000/api/v1/items/4").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v2.10.0'
            }).
          to_return(status: 200, body: @item, headers: {})
  end

  it "has a list of all item names as links" do
    visit items_path

    within("#item_list") do
      within "#item_1" do
        expect(page).to have_link("Item Nemo Facere")
      end
      within "#item_2" do
        expect(page).to have_link("Item Expedita Aliquam")
      end
    end
  end

  it "can click on item name to go to item show page" do
    visit items_path

    within("#item_list") do
      within "#item_1" do
        click_link("Item Nemo Facere")
      end
    end

    expect(current_path).to eq(item_path(4))
  end
end