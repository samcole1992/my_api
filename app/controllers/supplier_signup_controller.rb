require 'jwt'
require 'token'
require 'pry'

class SupplierSignupController < ApplicationController

  prepend_before_action :authorize, :only => []

  prepend_before_action :authorize_guest

    def create

  			@supplier = Supplier.new(supplier_params)

        token = Token.issue( { supplier_id: @supplier.id, valid_token: SecureRandom.hex } )
        @supplier.valid_token = token
  			if @supplier.save


  				# render json: @supplier, token: token, status: :created
          render json: SupplierSerializer.new(@supplier).serialized_json

  				# @supplier.send_welcome_mail

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
