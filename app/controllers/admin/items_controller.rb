class Admin::ItemsController < ApplicationController
def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)

  if @item.save
    redirect_to admin_item_path(@item), notice: "Item was successfully created."
  else
    render :new
  end
end

  def index
    @items = if params[:genre].present?
                  Item.where(genre_id: Genre.find_by(name: params[:genre]).id)
                else
                  Item.all
                end
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def create_genre
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to products_path, notice: 'ジャンルを追加しました。'
    else
      @items = Item.all
      @genres = Genre.all
      @new_genre = @genre
      render :index
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private
    def item_params
    params.require(:item).permit(:name, :description, :price, :stock, :genre_id)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
