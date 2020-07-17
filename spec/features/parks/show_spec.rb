require 'rails_helper'

RSpec.describe 'Amusement park show page' do
  it 'displays name and price of admissions' do
    disney = Park.create!(name: "Disneyland", admission_price: "$120")

    visit "/parks/#{disney.id}"

    expect(page).to have_content("Disneyland")
    expect(page).to have_content("Admissions: $120")

  end
end
