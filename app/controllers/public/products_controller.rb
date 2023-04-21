class Public::ProductsController < ApplicationController

  
def index
  @genre = Genre.all
  @product = Product.all
  @products = Kaminari.paginate_array(Product.where(sale_status: "sale")).page(params[:page]).per(8)
end



  
def show
  @product = Product.find(params[:id])
  @cart_product = CartProduct.new
  if current_customer
    @cart_products = current_customer.cart_products
  else
    @cart_products = []
  end
end
  

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
