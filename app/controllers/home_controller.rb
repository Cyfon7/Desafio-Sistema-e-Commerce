class HomeController < ApplicationController

  def index
    @ids_avaibles = ProductVariation.where.not(stock: 0).select(:product_id).distinct.pluck(:product_id)

    @products = Product.find(@ids_avaibles)
  end

  def show
    @product = Product.find(params[:id])

    @avaibles = @product.product_variations.where.not(stock: 0)
    
    @options = []
    @avaibles.each do |avaible|
      @options << [ avaible.variation, avaible.variation.options.pluck(:name, :value), avaible.added_price]
    end

    if params[:variation_id]
      @choise = ProductVariation.all.where(variation_id: params[:variation_id])[0]
    else
      @choise = @avaibles[0]
    end
    
  end


  def do_search

    respond_to do |format|
      format.html { redirect_to item_path(id: params[:id], variation_id: params[:variation_id]) }
    end
      
  end



end
