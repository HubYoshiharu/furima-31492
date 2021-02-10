class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_data = PurchaseData.new
  end

  def create
    @purchase_data = PurchaseData.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_data.valid?
      @purchase_data.save(params[:item_id], current_user.id)
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_data).permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number)
  end
end
