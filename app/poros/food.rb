class Food
  
  attr_reader :id,
              :description,
              :data_type,
              :publication_date,
              :food_nutrients,
              :ingredients,
              :gtin_upc,
              :brand_owner

  def initialize(attrs)
    @id = attrs[:fdcId]
    @description = attrs[:description]
    @data_type = attrs[:dataType]
    @publication_date = attrs[:publicationDate]
    @food_nutrients = attrs[:foodNutrients]
    @ingredients = attrs[:ingredients]
    @gtin_upc = attrs[:gtinUpc]
    @brand_owner = attrs[:brandOwner]
  end
end
