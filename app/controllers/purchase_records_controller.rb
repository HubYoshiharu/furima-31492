class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_record = PurchaseRecord.new
  end
end
