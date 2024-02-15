require "rails_helper"

RSpec.describe Food, vcr: true do
  it "exists" do
    attrs = {
      fdcId: 2353623,
      description: "A Low-Starch and High-Fiber Diet Intervention Impacts the Microbial Community of Raw Bovine Milk",
      dataType: "Experimental",
      publicationDate: "2022-10-28",
      foodNutrients: []
    }

    food = Food.new(attrs)

    expect(food.id).to eq(2353623)
    expect(food.description).to eq("A Low-Starch and High-Fiber Diet Intervention Impacts the Microbial Community of Raw Bovine Milk")
    expect(food.data_type).to eq("Experimental")
    expect(food.publication_date).to eq("2022-10-28")
    expect(food.food_nutrients).to be_an Array
  end
end
