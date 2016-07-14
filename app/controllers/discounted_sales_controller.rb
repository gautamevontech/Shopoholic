class DiscountedSalesController < ApplicationController
  before_action :set_discounted_sale, only: [:show, :edit, :update, :destroy]

  # GET /discounted_sales
  # GET /discounted_sales.json
  def index
    @discounted_sales = DiscountedSale.all
  end

  # GET /discounted_sales/1
  # GET /discounted_sales/1.json
  def show
  end

  # GET /discounted_sales/new
  def new
    @discounted_sale = DiscountedSale.new
  end

  # GET /discounted_sales/1/edit
  def edit
  end

  # POST /discounted_sales
  # POST /discounted_sales.json
  def create
    @discounted_sale = DiscountedSale.new(discounted_sale_params)

    respond_to do |format|
      if @discounted_sale.save
        format.html { redirect_to @discounted_sale, notice: 'Discounted sale was successfully created.' }
        format.json { render :show, status: :created, location: @discounted_sale }
      else
        format.html { render :new }
        format.json { render json: @discounted_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounted_sales/1
  # PATCH/PUT /discounted_sales/1.json
  def update
    respond_to do |format|
      if @discounted_sale.update(discounted_sale_params)
        format.html { redirect_to @discounted_sale, notice: 'Discounted sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @discounted_sale }
      else
        format.html { render :edit }
        format.json { render json: @discounted_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounted_sales/1
  # DELETE /discounted_sales/1.json
  def destroy
    @discounted_sale.destroy
    respond_to do |format|
      format.html { redirect_to discounted_sales_url, notice: 'Discounted sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discounted_sale
      @discounted_sale = DiscountedSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discounted_sale_params
      params.require(:discounted_sale).permit(:name, :discount_percent, :start_date, :end_date)
    end
end
