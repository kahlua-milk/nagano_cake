class Admin::ProductsController < ApplicationController
  before_action :require_admin_login
  def new
    @product = Product.new
    @genres = Genre.all
  end

def index
   @products = Product.all
   @products = Product.page(params[:page]).per(10)
end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_path(@product)
    else
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
    redirect_to admin_path(@product)
  else
    render 'edit'
  end
end

  def show
    @product = Product.find(params[:id])
  end

  private
  
    def require_admin_login
    unless admin_signed_in?
      redirect_to root_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :explanation, :price, :sale_status, :genre_id, :image)
  end
end
