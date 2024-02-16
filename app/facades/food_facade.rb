class FoodFacade

  def foods
    service = FoodService.new
    response = service.all_foods
    foods = response.map { |food| Food.new(food) }
  end

  def food(id)
    service = FoodService.new
    response = service.find_food(id)
    food = Food.new(response)
  end

  def search_by_ingredient(ingredient)
    service = FoodService.new
    response = service.find_by_ingredient(ingredient)
    foods = response.map { |food| Food.new(food) }
  end

  def by_ingredient_results_count(ingredient)
    service = FoodService.new
    response = service.total_by_ingredient(ingredient)
  end
end
