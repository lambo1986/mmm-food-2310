class FoodsController < ApplicationController
  def index
    @ingredient = params[:q]
    @searched_foods = FoodFacade.new.search_by_ingredient(@ingredient)
  end
end
