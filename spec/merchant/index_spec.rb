require 'rails_helper'

RSpec.describe "Merchant Index Page", type: :feature do
  before :each do
    @all_merchants = File.read('./spec/fixtures/all_merchants_fixture.json')
    stub_request(:get, "http://localhost:3000/merchants").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v2.10.0'
            }).
          to_return(status: 200, body: @all_merchants, headers: {})
  end

  it 'uses api to get all merchants' do
    visit merchants_path

    within("#merchant_list") do
      within("#ID_1") do 
        expect(page).to have_link("Schroeder-Jerde")
      end
      within("#ID_2") do
        expect(page).to have_link("Klein, Rempel and Jones")
      end
    end
  end

end