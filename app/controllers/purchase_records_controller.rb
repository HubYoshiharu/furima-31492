class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :generate_instance_for_found_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @purchase_data = PurchaseData.new
  end

  def create
    @purchase_data = PurchaseData.new(purchase_params)
    if @purchase_data.valid?
      pay_item
      @purchase_data.save(params[:item_id], current_user.id)
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_data).permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase_record.present?
  end

  def generate_instance_for_found_item
    @item = Item.find(params[:item_id])
  end    
end
