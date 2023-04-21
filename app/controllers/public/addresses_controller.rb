class Public::AddressesController < ApplicationController


  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end


  def create
    @address = Address.new(address_params)
  end


  def edit
  end


  def update
    @address = Address.find(params[:id])
  end


  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end



  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
