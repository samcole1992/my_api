require 'jwt'
require 'token'
require 'pry'

class BuyerSignupController < ApplicationController

  prepend_before_action :authorize, :only => []

  prepend_before_action :authorize_guest

    def create

  			@buyer = Buyer.new(buyer_params)

        token = Token.issue( { buyer_id: @buyer.id, valid_token: SecureRandom.hex } )
        @buyer.valid_token = token
  			if @buyer.save


  				# render json: @buyer, token: token, status: :created
          render json: BuyerSerializer.new(@buyer).serialized_json

  				# @buyer.send_welcome_mail

  			else

  				details = @buyer.errors.details
  				status = details.key?(:email) && details[:email].any? { |err| err[:error] == :taken } ? 409 : 422
  				render json: @buyer.errors, status: status

  			end

  	end

  		private

  		def buyer_params
  			params.require(:buyer).permit(:email)
  		end

end
