class Public::ProductsController < ApplicationController

  def index
    @genre = Genre.all
    @products = Product.all
if params[:genre].present?
  @selected_genre = Genre.find_by(name: params[:genre])
  @products = Kaminari.paginate_array(@selected_genre.products.where(sale_status: "sale")).page(params[:page]).per(8)
else # ジャンルが選択されていない場合
  @products = Kaminari.paginate_array(Product.where(sale_status: "sale")).page(params[:page]).per(8)
end
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
