class ItemAttributesController < ApplicationController
  before_action :set_item_attribute, only: %i[ show edit update destroy ]

  # GET /item_attributes or /item_attributes.json
  def index
    @item_attributes = ItemAttribute.all
  end

  # GET /item_attributes/1 or /item_attributes/1.json
  def show
  end

  # GET /item_attributes/new
  def new
    @item_attribute = ItemAttribute.new
  end

  # GET /item_attributes/1/edit
  def edit
  end

  # POST /item_attributes or /item_attributes.json
  def create
    @item_attribute = ItemAttribute.new(item_attribute_params)

    respond_to do |format|
      if @item_attribute.save
        format.html { redirect_to @item_attribute, notice: "Item attribute was successfully created." }
        format.json { render :show, status: :created, location: @item_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_attributes/1 or /item_attributes/1.json
  def update
    respond_to do |format|
      if @item_attribute.update(item_attribute_params)
        format.html { redirect_to @item_attribute, notice: "Item attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @item_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_attributes/1 or /item_attributes/1.json
  def destroy
    @item_attribute.destroy
    respond_to do |format|
      format.html { redirect_to item_attributes_url, notice: "Item attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_attribute
      @item_attribute = ItemAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_attribute_params
      params.fetch(:item_attribute, {})
    end
end
