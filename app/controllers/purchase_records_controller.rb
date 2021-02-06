class PurchaseRecordsController < ApplicationController
  def index
  end

  def new
    @purchase_record = PurchaseRecord.new
  end
end
