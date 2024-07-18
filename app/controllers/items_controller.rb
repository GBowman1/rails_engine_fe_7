class ItemsController < ApplicationController
  def index
    @items = EngineFacade.get_all_items
  end

  def show
    @item = EngineFacade.get_item(params[:id])
  end
end