class MerchantController < ApplicationController
  def index
    conn = Faraday.new(url: 'http://localhost:3000/api/v1') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end
    response = conn.get('/merchants')

    json = JSON.parse(response.body, symbolize_names: true)

    @merchants = json[:data]
  end
end