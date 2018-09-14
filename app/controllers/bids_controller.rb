class BidsController < ApplicationController
  prepend_before_action :authorize

  def index

    @bids = Bid.all
    

  end

  def show

  end
  def new

  end

  def create

  end

  def edit

  end
  def update

  end

  def destroy

  end

end
