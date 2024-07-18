class EngineService
  def self.conn
    Faraday.new(url: 'http://localhost:3000/api/v1') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end
  end

  def self.get_all_merchants
    response = conn.get('/merchants')

    JSON.parse(response.body, symbolize_names: true)
  end
end