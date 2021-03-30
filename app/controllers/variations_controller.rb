class VariationsController < ApplicationController
  before_action :set_variation, only: %i[ show edit update destroy ]

  # GET /variations or /variations.json
  def index
    @variations = Variation.all
  end

  # GET /variations/1 or /variations/1.json
  def show
  end

  # GET /variations/new
  def new
    @variation = Variation.new
    @variation.variation_options.build
    
  end

  # GET /variations/1/edit
  def edit
  end

  # POST /variations or /variations.json
  def create
    @variation = Variation.new(variation_params)

    respond_to do |format|
      if @variation.save
        format.html { redirect_to new_product_path, notice: "Variation was successfully created." }
        format.json { render :show, status: :created, location: @variation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variations/1 or /variations/1.json
  def update
    respond_to do |format|
      if @variation.update(variation_params)
        format.html { redirect_to @variation, notice: "Variation was successfully updated." }
        format.json { render :show, status: :ok, location: @variation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variations/1 or /variations/1.json
  def destroy
    @variation.destroy
    respond_to do |format|
      format.html { redirect_to variations_url, notice: "Variation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variation
      @variation = Variation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variation_params
      params.require(:variation).permit(:name, variation_options_attributes: [:id, :variation_id, :option_id, :_destroy])
    end
end
