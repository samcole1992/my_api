require 'jwt'
require 'token'

class BuyerSigninController < ApplicationController

prepend_before_action :authorize, :only => [:destroy]

  def create

    @buyer = Buyer.find_by(email: buyer_params[:email])

    if @buyer && @buyer.authenticate(buyer_params[:password])

      raise 'anonymous_id is blank!' if anonymous_id.blank?


      token = Token.issue( { buyer_id: @buyer.id, valid_token: @buyer.valid_token } )
      render json: @buyer, token: token

    else

      render json:  { error: "Unauthorized" }, status: 401

    end

  end


  # DELETE /signin
  def destroy
    current_user.refresh_valid_token!
    render json: current_user
  end


  private

  def buyer_params
    params.require(:buyer).permit(:email, :password)
  end
end
