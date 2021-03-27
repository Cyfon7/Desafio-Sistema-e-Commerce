class HomeController < ApplicationController

  def index
    @products = Variation.product_list
  end
end
