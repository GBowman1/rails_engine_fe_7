class EngineService
  def self.conn
    Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end
  end

  def self.get_all_merchants
    response = conn.get('/api/v1/merchants')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_merchant_items(merchant_id)
    response = conn.get("/api/v1/merchants/#{merchant_id}/items")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_merchant(merchant_id)
    response = conn.get("/api/v1/merchants/#{merchant_id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_all_items
    response = conn.get('/api/v1/items')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_item(item_id)
    response = conn.get("/api/v1/items/#{item_id}")

    JSON.parse(response.body, symbolize_names: true)
  end
end