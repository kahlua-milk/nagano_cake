class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end
  
def index
  @products = if params[:genre].present?
                Product.where(genre: params[:genre])
              else
                Product.all
              end
  @genres = Genre.all
  @new_genre = Genre.new
end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      @genres = Product.genres
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end

def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    flash[:success] = "商品情報が更新されました"
    redirect_to admin_product_path(@product)
  else
    render 'edit'
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
