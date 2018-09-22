class OffersController < ApplicationController
  prepend_before_action :authorize

  def index

    @offers = current_user.offers

    render json: OfferSerializer.new(@offers).serialized_json

  end

  def show
    @offer = Offer.find(params[:id])

    render json: OfferSerializer.new(@offer).serialized_json

  end
  def all
    @offers = Offer.all

    render json: OfferSerializer.new(@offers).serialized_json
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.supplier = current_user
    if @offer.save
      render json: OfferSerializer.new(@offer).serialized_json

    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.supplier = current_user
    if @offer.update_attributes(offer_params)
      render json: OfferSerializer.new(@offer).serialized_json

    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def offer_params
    params.require(:offer).permit(:id, :buyer_id, :supplier_id, :updated_at, :created_at, :deleted_at,:date_issued, :fulfilled)
  end

end
