class EngineFacade
  def self.get_all_merchants
    json = EngineService.get_all_merchants

    json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def self.get_merchant_items(merchant_id)
    json = EngineService.get_merchant_items(merchant_id)

    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def self.get_merchant(merchant_id)
    json = EngineService.get_merchant(merchant_id)

    Merchant.new(json[:data])
  end

  def self.get_all_items
    json = EngineService.get_all_items

    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def self.get_item(item_id)
    json = EngineService.get_item(item_id)

    Item.new(json[:data])
  end
end