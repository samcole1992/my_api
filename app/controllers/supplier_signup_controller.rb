require 'jwt'
require 'token'
require 'pry'

class SupplierSignupController < ApplicationController

  prepend_before_action :authorize, :only => []

  prepend_before_action :authorize_guest

    def create

  			@supplier = Supplier.new(supplier_params)

        @supplier.valid_token = SecureRandom.hex

  			if @supplier.save

          token = Token.issue( { supplier_id: @supplier.id, valid_token: @supplier.valid_token } )
          options = {}
          options[:meta] = { token: token }

          # @supplier.send_welcome_mail

          render json: SupplierSerializer.new(@supplier, options).serialized_json


  			else

  				details = @supplier.errors.details
  				status = details.key?(:email) && details[:email].any? { |err| err[:error] == :taken } ? 409 : 422
  				render json: @supplier.errors, status: status

  			end

  	end

  		private

  		def supplier_params
  			params.require(:supplier).permit(:email)
  		end

end
