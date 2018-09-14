class Buyer < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :comments
  has_many :bids
  has_many :orders, through: :bids
  has_many :products, through: :bids
  has_many :notifications


    def refresh_valid_token!
  		self.valid_token = SecureRandom.hex
  		self.save!
  	end

    def send_welcome_mail
        BuyerMailer.delay.welcome_mail(self) if Rails.env.production?
        BuyerMailer.welcome_mail(self).deliver_now unless Rails.env.production?
      end

    private

      def generate_password(size=4)
        c = %w(b c d f g h j k l m n p qu r s t v w x z ch chr cr fr nd ng nk nt ph pr rd sh sl sp st th tr lt 0 1 2 3 4 5 6 7 8 9)
        v = %w(a e i o u y)
        f, r = true, ''

        (size * 2).times do
          r << (f ? c[rand * c.size] : v[rand * v.size])
          f = !f
        end
        self.password = self.password_temp = r
      end

end
