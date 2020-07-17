require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  it 'displays all mechanics and their info' do
    jackie = Mechanic.create!(name: "Jackie Casas", years_of_experience: 6)
    eliana = Mechanic.create!(name: "Eliana Alvarez", years_of_experience: 9)
    amanda = Mechanic.create!(name: "Amanda Petro", years_of_experience: 12)

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    exepct(page).to have_content("Jackie Casas - 6 years of experience")
    exepct(page).to have_content("Eliana Alvarez - 9 years of experience")
    exepct(page).to have_content("Amanda Petro - 12 years of experience")
  end
end
