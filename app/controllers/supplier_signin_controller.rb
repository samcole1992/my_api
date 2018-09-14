class SupplierSigninController < ApplicationController

prepend_before_action :authorize, :only => [:destroy]

  def create

    @supplier = Supplier.find_by(email: supplier_params[:email])

    if @supplier && @supplier.authenticate(supplier_params[:password])

      raise 'anonymous_id is blank!' if anonymous_id.blank?


      token = Token.issue( { supplier_id: @supplier.id, valid_token: @supplier.valid_token } )
      render json: @supplier, token: token

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

  def supplier_params
    params.require(:supplier).permit(:email, :password)
  end
end
