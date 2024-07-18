class EngineFacade
  def self.get_all_merchants
    json = EngineService.get_all_merchants

    json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end
end