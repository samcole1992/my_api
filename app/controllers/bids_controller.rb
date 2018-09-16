class BidsController < ApplicationController
  prepend_before_action :authorize

  def index

    @bids = Bid.all
    @bids = current_user.bids

    render json: BidSerializer.new(@bids).serialized_json

  end

  def show
    @bid = Bid.find(params[:id])

    render json: BidSerializer.new(@bid).serialized_json

  end
  def new

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

  def edit

  end
  def update
    @bid = Bid.new(bid_params)
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
    params.require(:bid).permit(:id, :, :state, :zip, :allergies, :cookie_type, :cookie_amount, :payment, :completion, :fulfilled)
  end

end
