class OrdersController < ApplicationController
  prepend_before_action :authorize
  def index
    @orders = current_user.orders

    render json: OrderSerializer.new(@orders).serialized_json

  end

  def show
    @order = Order.find(params[:id])

    render json: OrderSerializer.new(@order).serialized_json

  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: OrderSerializer.new(@order).serialized_json

    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      render json: OrderSerializer.new(@order).serialized_json

    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def order_params
    params.require(:order).permit(:id, :buyer_id, :supplier_id,:buyer_notes, :supplier_notes, :updated_at, :created_at, :deleted_at, :fulfilled, :buyer_fulfilled, :supplier_fulfilled, :bid_id, :offer_id)
  end
end
