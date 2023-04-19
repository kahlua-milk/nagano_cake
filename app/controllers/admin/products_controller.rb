class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end
  
  def index
    @products = if params[:genre].present?
                  Product.where(genre_id: Product.genres[params[:genre]])
                else
                  Product.all
                end
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "商品を登録しました。"
    else
      @genres = Product.genres
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :price, :sale_status, :genre_id, :image)
  end
end
