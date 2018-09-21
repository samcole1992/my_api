class BidsController < ApplicationController
  prepend_before_action :authorize

  def index

    @bids = current_user.bids

    render json: BidSerializer.new(@bids).serialized_json

  end

  def show
    @bid = Bid.find(params[:id])

    render json: BidSerializer.new(@bid).serialized_json

  end
  def all
    @bids = Bid.all

    render json: BidSerializer.new(@bids).serialized_json
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.buyer = current_user
    if @bid.save
      render json: BidSerializer.new(@bid).serialized_json

    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  def update
    @bid = Bid.find(params[:id])
    @bid.buyer = current_user
    if @bid.update_attributes(bid_params)
      render json: BidSerializer.new(@bid).serialized_json

    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def bid_params
    params.require(:bid).permit(:id, :buyer_id, :supplier_id, :updated_at, :created_at, :deleted_at, :fulfilled)
  end

end
