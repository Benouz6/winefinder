class PagesController < ApplicationController
  def home
  end

  def search
    if params[:food_id]
      @defaut_food_id = params[:food_id]
    else
      @defaut_food_id = Food.first.id
    end
  end

  def article

  end
end
