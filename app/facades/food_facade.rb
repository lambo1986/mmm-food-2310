class FoodFacade

  def foods
    service = FoodService.new
    call = service.all_foods
    foods = call.map { |food| Food.new(food) }
  end

  def food(id)
    service = FoodService.new
    call = service.find_food(id)
    food = Food.new(call)
  end

  def search_by_ingredient(ingredient)
    service = FoodService.new
    call = service.find_by_ingredient(ingredient)
    foods = call.map { |food| Food.new(food) }
  end
end
