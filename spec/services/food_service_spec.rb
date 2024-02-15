require "rails_helper"

RSpec.describe FoodService, vcr: true do
  describe ".all_foods" do
    it "returns an array of all foods" do
      foods = FoodService.new.all_foods

      expect(foods).to be_an(Array)
      expect(foods.first).to be_a(Hash)
      expect(foods.first[:fdcId]).to be_an(Integer)
      expect(foods.first[:dataType]).to be_a(String)
      expect(foods.first[:description]).to be_a(String)
      expect(foods.first[:foodNutrients]).to be_an(Array)
    end
  end

  describe ".find_food(fdc_id)" do
    it "returns 1 food" do
      food = FoodService.new.find_food(2341752)

      expect(food).to be_a(Hash)
      expect(food[:fdcId]).to be_an(Integer)
      expect(food[:dataType]).to be_a(String)
      expect(food[:description]).to be_a(String)
      expect(food[:foodNutrients]).to be_an(Array)
    end
  end

  describe ".find_by_ingredient(ingredient)" do
    it "returns 10 foods that contain the ingredient" do
      foods = FoodService.new.find_by_ingredient("anchovies")

      expect(foods).to be_an(Array)
      expect(foods.first).to be_a(Hash)
      expect(foods.first[:fdcId]).to be_an(Integer)
      expect(foods.first[:dataType]).to be_a(String)
      expect(foods.first[:description]).to be_a(String)
      expect(foods.first[:foodNutrients]).to be_an(Array)
      expect(foods.first[:ingredients]).to be_a(String)
    end
  end
end
