require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  it 'displays mechanic name, years of experience, and names of all rides they are working on' do
    jackie = Mechanic.create!(name: "Jackie Casas", years_of_experience: 6)
    disney = Park.create!(name: "Disneyland", admission_price: "$120")
    splash_mountain = disney.rides.create!(name: "Splash Mountain", thrill_rating: 7.8)
    autopia = disney.rides.create!(name: "Autopia", thrill_rating: 3.5)

    RideMechanic.create!(ride: splash_mountain, mechanic: jackie)
    RideMechanic.create!(ride: autopia, mechanic: jackie)

    visit "/mechanics/#{jackie.id}"

    expect(page).to have_content("Mechanic: Jackie Casas")
    expect(page).to have_content("Years of Experience: 6")
    expect(page).to have_content("Current rides they're working on:")
    expect(page).to have_content("Splash Mountain")
    expect(page).to have_content("Autopia")
  end

  it 'displays form to add ride to mechanic workload' do
    jackie = Mechanic.create!(name: "Jackie Casas", years_of_experience: 6)
    disney = Park.create!(name: "Disneyland", admission_price: "$120")
    splash_mountain = disney.rides.create!(name: "Splash Mountain", thrill_rating: 7.8)
    autopia = disney.rides.create!(name: "Autopia", thrill_rating: 3.5)
    haunted_mansion = disney.rides.create!(name: "The Haunted Mansion", thrill_rating: 8.2)

    RideMechanic.create!(ride: splash_mountain, mechanic: jackie)
    RideMechanic.create!(ride: autopia, mechanic: jackie)

    visit "/mechanics/#{jackie.id}"

    within ".form" do
      expect(page).to have_content("Id")
      fill_in :id, with: "#{haunted_mansion.id}"
      expect(page).to have_button("Submit")
      click_on "Submit"
    end

    expect(curent_path).to eq("/mechanics/#{jackie.id}")

    expect(page).to have_content("The Haunted Mansion")
  end
end
