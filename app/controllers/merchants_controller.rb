class MerchantsController < ApplicationController
  def index
    @merchants = EngineFacade.get_all_merchants
  end

  def show
    @merchant = EngineFacade.get_merchant(params[:id])
    @items = EngineFacade.get_merchant_items(params[:id])
  end
end