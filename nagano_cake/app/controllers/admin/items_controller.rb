class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  if@item.update(item_params)
    flash[:notice] = "You have updated item successfully."
    redirect_to admin_items_path
  else
    render :edit
  end
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :image_id, :introduction, :price, :is_active, :created_at, :updated_at )
  end

end