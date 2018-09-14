require 'jwt'
require 'token'
require 'pry'
class ApplicationController < ActionController::API

  before_action :authorize

  protected

  def current_user
        @current_user
    end

  def anonymous_id
        @anonymous_id
      end
  def authorize
          # If a "before" filter renders or redirects, the action will not run.
    if invalid_token || current_user.blank?
      render json:  {error: "unauthorized"}, status: 401
    end
  end
  def authorize_guest
    # If a "before" filter renders or redirects, the action will not run.
    if invalid_token || (current_user.blank? && anonymous_id.blank?)
      render json:  {error: "unauthorized"}, status: 401
    end
  end

    private


      def valid_token
        return false if request.authorization == nil

        token = request.authorization.scan(/Bearer (.*)$/).flatten.last

        begin
          decoded = Token.decode(token) if defined? token

          # throws JWT::ExpiredSignature < DecodeError
          # throws JWT::InvalidIssuerError < DecodeError
          # throws JWT::InvalidIatError < DecodeError
          # throws JWT::VerificationError < DecodeError

        rescue JWT::DecodeError => ex
            # Catch errors from bad tokens
            logger.error ex.inspect
            return false
        end

        return false if decoded == nil || !defined? decoded

        # when authenticating user, check user_id and also valid_token (stored in database)
        # valid token changes when users change their passwords
        if decoded["buyer_id"].present?
          return false unless decoded.has_key?("valid_token")
          @current_user = Buyer.find_by_id_and_valid_token(decoded['buyer_id'], decoded['valid_token'])
          return false unless @current_user
          return true
        elsif decoded["supplier_id"].present?
          return false unless decoded.has_key?("valid_token")
          @current_user = Supplier.find_by_id_and_valid_token(decoded['supplier_id'], decoded['valid_token'])
          return false unless @current_user
          return true
        elsif decoded["anonymous_id"].present?
          @anonymous_id = decoded['anonymous_id']
          return true
        end

        return false

      end


      def invalid_token
        !valid_token
      end





end
