require 'jwt'
require 'token'
require 'pry'

class BuyerSignupController < ApplicationController

  prepend_before_action :authorize, :only => []

  prepend_before_action :authorize_guest

    def create

  			@buyer = Buyer.new(buyer_params)

        @buyer.valid_token = SecureRandom.hex

  			if @buyer.save
          token = Token.issue( { buyer_id: @buyer.id, valid_token: @buyer.valid_token } )

          options = {}
          options[:meta] = { token: token }

          # @buyer.send_welcome_mail

          render json: BuyerSerializer.new(@buyer, options).serialized_json


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
