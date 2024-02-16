require "rails_helper"

RSpec.describe "welcome index", vcr: true, type: :feature do
  it "has a search form for foods by ingredient" do
    visit "/"

    expect(page).to have_content("Ingredient Search")

    fill_in :q, with: "sweet potatoes"
    click_button "Search"

    expect(current_path).to eq(foods_path)
    expect(page).to have_link("New Search")
    expect(page).to have_content("Search Results")
    expect(page).to have_content("Total Results:")
    expect(page).to have_content("Foods Containing Ingredient 'sweet potatoes':")
    expect(page).to have_content("GTIN/UPC:")
    expect(page).to have_content("Description:")
    expect(page).to have_content("Brand Owner:")
    expect(page).to have_content("Ingredients:")

    click_link "New Search"

    expect(current_path).to eq(root_path)
  end
end
