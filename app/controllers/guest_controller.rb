require "token"
class GuestController < ApplicationController

    skip_before_action :authorize

    # POST /guest
    def create
        jwt = Token.issue( { anonymous_id: SecureRandom.hex }, Time.now + 2.hours )
        render json:  { token: jwt }
    end

  end
