class HomeController < ApplicationController

  def index
    @ids_available = ProductVariation.where.not(stock: 0).select(:product_id).distinct.pluck(:product_id)

    @products = Product.find(@ids_available)
  end

  def show
    @product = Product.find(params[:id])

    @availables = @product.product_variations.where.not(stock: 0)
    
    @options = []
    @availables.each do |available|
      @options << [ available.variation, available.variation.options.pluck(:name, :value), available.added_price]
    end

    if params[:variation_id]
      @choise = ProductVariation.all.where(variation_id: params[:variation_id])[0]
    else
      @choise = @availables[0]
    end
    
  end

  def do_search

    respond_to do |format|
      format.html { redirect_to item_path(id: params[:id], variation_id: params[:variation_id]) }
    end
      
  end

end
