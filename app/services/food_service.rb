class FoodService
  BASE_KEY = Rails.application.credentials.food_data_api_key[:key]
  BASE_URL = "https://api.nal.usda.gov"

  def all_foods
    foods = get_url("/fdc/v1/foods/list?api_key=#{BASE_KEY}")
  end

  def find_food(food_id)
    food = get_url("/fdc/v1/food/#{food_id}?api_key=#{BASE_KEY}")
  end

  def find_by_ingredient(ingredient)
    foods = get_url("/fdc/v1/foods/search?query=#{ingredient}&api_key=#{BASE_KEY}")
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
    foods = get_url("/fdc/v1/foods/search?query=#{ingredient}&api_key=#{BASE_KEY}")
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
    Faraday.new(url: BASE_URL)
  end
end
