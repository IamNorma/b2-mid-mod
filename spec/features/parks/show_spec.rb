require 'rails_helper'

RSpec.describe 'Amusement park show page' do
  it 'displays name and price of admissions' do
    disney = Park.create!(name: "Disneyland", admission_price: "$120")

    visit "/parks/#{disney.id}"

    expect(page).to have_content("Disneyland")
    expect(page).to have_content("Admissions: $120")
  end

  it 'displays names of all rides in alphabetical order' do
    disney = Park.create!(name: "Disneyland", admission_price: "$120")
    splash_mountain = disney.rides.create!(name: "Splash Mountain", thrill_rating: 7.8)
    haunted_mansion = disney.rides.create!(name: "The Haunted Mansion", thrill_rating: 8.2)
    autopia = disney.rides.create!(name: "Autopia", thrill_rating: 3.5)

    visit "/parks/#{disney.id}"

    expect(page).to have_content("Rides:")
    expect(page).to have_content("Autopia")
    expect(page).to have_content("Splash Mountain")
    expect(page).to have_content("The Haunted Mansion")
  end
end
