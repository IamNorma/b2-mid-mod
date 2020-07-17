require 'rails_helper'

RSpec.describe Park do
  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'methods' do
    it '#alphabetical_rides' do
      disney = Park.create!(name: "Disneyland", admission_price: "$120")
      splash_mountain = disney.rides.create!(name: "Splash Mountain", thrill_rating: 7.8)
      haunted_mansion = disney.rides.create!(name: "The Haunted Mansion", thrill_rating: 8.2)
      autopia = disney.rides.create!(name: "Autopia", thrill_rating: 3.5)

      expect(disney.alphabetical_rides).to eq([autopia, splash_mountain, haunted_mansion])
    end
  end
end
