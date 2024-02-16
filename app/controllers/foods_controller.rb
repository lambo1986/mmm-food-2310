class FoodsController < ApplicationController
  def index
    @ingredient = params[:q]
    @searched_foods = FoodFacade.new.search_by_ingredient(@ingredient)
    @results_count = FoodFacade.new.results_count(@ingredient)
  end
end
