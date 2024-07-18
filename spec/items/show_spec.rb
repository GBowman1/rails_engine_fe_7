require "rails_helper"

RSpec.describe "Items Show Page", type: :feature do
  before :each do
    @item = File.read('./spec/fixtures/item_fixture.json')

    stub_request(:get, "http://localhost:3000/items/4").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v2.10.0'
            }).
          to_return(status: 200, body: @item, headers: {})
  end

  it "SHows item info" do 
    visit item_path(4)

    expect(page).to have_content("Item Qui Veritatis")
    expect(page).to have_content("Totam labore quia harum dicta eum consequatur qui. Corporis inventore consequatur. Illum facilis tempora nihil placeat rerum sint est. Placeat ut aut. Eligendi perspiciatis unde eum sapiente velit.")
    expect(page).to have_content("Price: 906.17")
    expect(page).to have_content("Merchant ID: 9")
    expect(page).to have_content("Item ID: 179")
  end
end
