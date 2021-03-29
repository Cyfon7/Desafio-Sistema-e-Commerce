class HomeController < ApplicationController

  def index
    @products = Product.all #Variation.product_list
  end
end
