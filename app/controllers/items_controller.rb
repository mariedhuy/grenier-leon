class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(items_params)
  end

  private

  def items_params
    params.require(:item).permit(:name, :category, :picture, :description, :user_id)
  end

end
