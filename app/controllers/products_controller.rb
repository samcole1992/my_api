class ProductsController < ApplicationController
  prepend_before_action :authorize
  def index
    @item
    if current_user.is_a?(Buyer)
      @item = current_user.bids.find(params[:bid_id])
    else
      @item = current_user.offers.find(params[:offer_id])
    end
    @products = @item.products
    render json: ProductSerializer.new(@products).serialized_json
end

  def show
    @product = Product.find(params[:id])
    render json: ProductSerializer.new(@product).serialized_json

  end

  def create

    if current_user.is_a?(Buyer)
      @item = current_user.bids.find(params[:bid_id])
    else
      @item = current_user.offers.find(params[:offer_id])
    end
    @product = @item.products.new(product_params)
if @product.save!
  render json: ProductSerializer.new(@product).serialized_json

else
  render json: @product.errors, status: :unprocessable_entity

end

  end


  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      render json: ProductSerializer.new(@product).serialized_json
    else
      render json: @product.errors, status: :unprocessable_entity
    end
# format numbers in item object

  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: ProductSerializer.new(@product).serialized_json
        else
          render json: @product.errors, status: :unprocessable_entity
        end

  end


      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:description,:date_issued, :bid_id, :offer_id, :amount, :name, :created_at, :updated_at, :price)
      end

end
