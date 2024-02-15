class Food
  attr_reader :id,
              :description,
              :data_type,
              :publication_date,
              :food_nutrients,
              :ingredients
  def initialize(attrs)
    @id = attrs[:fdcId]
    @description = attrs[:description]
    @data_type = attrs[:dataType]
    @publication_date = attrs[:publicationDate]
    @food_nutrients = attrs[:foodNutrients]
    @ingredients = attrs[:ingredients]
  end
end
