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
end
