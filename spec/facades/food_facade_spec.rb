require "rails_helper"

RSpec.describe FoodFacade, vcr: true do
  describe ".foods" do
    it "returns an array of all foods" do
      foods_facade = FoodFacade.new

      expect(foods_facade).to be_a(FoodFacade)
      expect(foods_facade).to respond_to(:foods)
      expect(foods_facade.foods).to be_a(Array)
      expect(foods_facade.foods.first).to be_a(Food)
    end
  end

  describe ".food" do
    it "returns a single food by id" do
      food = FoodFacade.new.food(2341752)

      expect(food).to be_a(Food)
      expect(food.id).to eq(2341752)
    end
  end
end
