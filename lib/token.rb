require 'jwt'

class Token

  ALGO = 'HS256'
  ISS = "This is a my application"
  # Implementers MAY provide for some small leeway, usually no more than a few minutes, to account for clock skew
  LEEWAY = 30 # seconds

  def self.issue(payload, expiration = Time.now + 6.months)

    # https://tools.ietf.org/html/rfc7519
    # https://stormpath.com/blog/jwt-the-right-way

    # iat: https://github.com/jwt/ruby-jwt#issued-at-claim
    iat = Time.now.to_i
    iat_payload = { iat: iat }
    payload.merge! iat_payload

    # exp: https://github.com/jwt/ruby-jwt#expiration-time-claim
    exp = expiration.to_i
    exp_payload = { exp: exp }
    payload.merge! exp_payload

    # iss: https://github.com/jwt/ruby-jwt#issuer-claim
    iss_payload = { iss: ISS }
    payload.merge! iss_payload

    JWT.encode(payload, auth_secret, ALGO)

  end


  # return first decoded token which is user_id or anonymous_id
  # throws JWT::ExpiredSignature < DecodeError
  # throws JWT::InvalidIssuerError < DecodeError
  # throws JWT::InvalidIatError < DecodeError
  # throws JWT::VerificationError < DecodeError
  def self.decode(token)
    decoded = JWT.decode token, auth_secret, true, { iat_leeway: LEEWAY, verify_iat: true, exp_leeway: LEEWAY, iss: ISS, verify_iss: true, algorithm: ALGO }
    decoded.first
  end


  private

  def self.auth_secret
    Rails.application.secrets.secret_key_base
  end


end
