class Public::ProductsController < ApplicationController
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
    @new_genre = Genre.new # 変数名を変更
  end

  def create_genre
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to products_path, notice: 'ジャンルを追加しました。'
    else
      @products = Product.all
      @genres = Genre.all
      @new_genre = @genre # 変数名を変更
      render :index
    end
  end
  
    def show
    @product = Product.find(params[:id])
    end
  

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
