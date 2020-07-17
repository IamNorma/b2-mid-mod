class Park < ApplicationRecord
  has_many :rides

  def alphabetical_rides
    self.rides.order(:name)
  end
end
