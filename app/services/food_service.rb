class FoodService

  def all_foods
    foods = get_url("/fdc/v1/foods/list?")
  end

  def find_food(food_id)
    food = get_url("/fdc/v1/food/#{food_id}?")
  end

  def find_by_ingredient(ingredient)
    foods = get_url("/fdc/v1/foods/search?query=#{ingredient}")
    foods = foods[:foods]
    filtered_foods = foods.select do |food|
      if food[:ingredients]
        food_ingredients = food[:ingredients].downcase
        food_ingredients.include?(ingredient.downcase)
      else
        false
      end
    end
    filtered_foods.take(10)
  end

  def total_by_ingredient(ingredient)
    foods = get_url("/fdc/v1/foods/search?query=#{ingredient}")
    foods = foods[:foods]
    filtered_foods = foods.select do |food|
      if food[:ingredients]
        food_ingredients = food[:ingredients].downcase
        food_ingredients.include?(ingredient.downcase)
      else
        false
      end
    end
    filtered_foods.count
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.params[:api_key] = Rails.application.credentials.food_data_api_key[:key]
    end
  end
end
