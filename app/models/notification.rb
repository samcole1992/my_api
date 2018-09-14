class Notification < ApplicationRecord
  belongs_to :supplier
  belongs_to :buyer

end
