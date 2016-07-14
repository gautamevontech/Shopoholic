class DiscountedProductsController < ApplicationController
  before_action :set_discounted_product, only: [:show, :edit, :update, :destroy]

  # GET /discounted_products
  # GET /discounted_products.json
  def index
    @discounted_products = DiscountedProduct.all
  end

  # GET /discounted_products/1
  # GET /discounted_products/1.json
  def show
  end

  # GET /discounted_products/new
  def new
    @discounted_product = DiscountedProduct.new
  end

  # GET /discounted_products/1/edit
  def edit
  end

  # POST /discounted_products
  # POST /discounted_products.json
  def create
    @discounted_product = DiscountedProduct.new(discounted_product_params)

    respond_to do |format|
      if @discounted_product.save
        format.html { redirect_to @discounted_product, notice: 'Discounted product was successfully created.' }
        format.json { render :show, status: :created, location: @discounted_product }
      else
        format.html { render :new }
        format.json { render json: @discounted_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounted_products/1
  # PATCH/PUT /discounted_products/1.json
  def update
    respond_to do |format|
      if @discounted_product.update(discounted_product_params)
        format.html { redirect_to @discounted_product, notice: 'Discounted product was successfully updated.' }
        format.json { render :show, status: :ok, location: @discounted_product }
      else
        format.html { render :edit }
        format.json { render json: @discounted_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounted_products/1
  # DELETE /discounted_products/1.json
  def destroy
    @discounted_product.destroy
    respond_to do |format|
      format.html { redirect_to discounted_products_url, notice: 'Discounted product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discounted_product
      @discounted_product = DiscountedProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discounted_product_params
      params.require(:discounted_product).permit(:discounted_sale_id, :product_id)
    end
end
