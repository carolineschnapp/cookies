class CookieSalesController < ApplicationController
  before_action :set_cookie_sale, only: [:show, :edit, :update, :destroy]

  # GET /cookie_sales
  # GET /cookie_sales.json
  def index
    @cookie_sales = CookieSale.all
    # SELECT first_name, sum(sales_cents)
    # FROM cookie_sales
    # WHERE first_name <> ''
    # GROUP BY first_name
    # ORDER BY sum(sales_cents) DESC
    #
    # @winners_with_sales_count = CookieSale
    #   .where.not(first_name: '')
    #   .group(:first_name)
    #   .sum(:sales_cents)
    #   .sort_by { |k,v| v }
    #   .reverse
    #
    # SELECT first_name, SUM(sales_cents) AS sales_total
    # FROM cookie_sales
    # WHERE first_name <> ''
    # GROUP BY first_name
    # ORDER BY sales_total DESC
    #
    @hall_of_fame = CookieSale
      .select(:first_name, 'SUM(sales_cents) AS sales_total')
      .where.not(first_name: '')
      .group(:first_name)
      .order('sales_total DESC')
    # SELECT `cookie_sales`.`first_name`, SUM(sales_cents) AS sales_total FROM `cookie_sales` WHERE (`cookie_sales`.`first_name` != '') GROUP BY `cookie_sales`.`first_name` ORDER BY sales_total DESC
    #
    # SELECT count(DISTINCT first_name)
    # FROM cookie_sales
    # => 4
    #
    @salesmen_count = CookieSale.count('DISTINCT first_name')
  end

  # GET /cookie_sales/1
  # GET /cookie_sales/1.json
  def show
  end

  # GET /cookie_sales/new
  def new
    @cookie_sale = CookieSale.new
  end

  # GET /cookie_sales/1/edit
  def edit
  end

  # POST /cookie_sales
  # POST /cookie_sales.json
  def create
    @cookie_sale = CookieSale.new(cookie_sale_params)

    respond_to do |format|
      if @cookie_sale.save
        format.html { redirect_to @cookie_sale, notice: 'Cookie sale was successfully created.' }
        format.json { render :show, status: :created, location: @cookie_sale }
      else
        format.html { render :new }
        format.json { render json: @cookie_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cookie_sales/1
  # PATCH/PUT /cookie_sales/1.json
  def update
    respond_to do |format|
      if @cookie_sale.update(cookie_sale_params)
        format.html { redirect_to @cookie_sale, notice: 'Cookie sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @cookie_sale }
      else
        format.html { render :edit }
        format.json { render json: @cookie_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cookie_sales/1
  # DELETE /cookie_sales/1.json
  def destroy
    @cookie_sale.destroy
    respond_to do |format|
      format.html { redirect_to cookie_sales_url, notice: 'Cookie sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookie_sale
      @cookie_sale = CookieSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cookie_sale_params
      params.require(:cookie_sale).permit(:first_name, :sales, :sale_date)
    end
end
