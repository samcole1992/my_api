class SuppliersController < ApplicationController
  prepend_before_action :authorize
  def index

  end

  def show

  end
  def new

  end

  def create

  end

  def show
    render json: current_user
  end


  # PATCH /user
  def update

    if current_user.update_attributes(user_params)
      render json: current_user
    else
      render json: current_user.errors, status: :unprocessable_entity
    end

  end

  def destroy

  end
end
