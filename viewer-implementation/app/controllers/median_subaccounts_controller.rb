class MedianSubaccountsController < ApplicationController
  before_action :set_median_subaccount, only: [:show, :edit, :update, :destroy]

  # GET /median_subaccounts
  # GET /median_subaccounts.json
  def index
    @median_subaccounts = MedianSubaccount.all
  end

  # GET /median_subaccounts/1
  # GET /median_subaccounts/1.json
  def show
  end

  # GET /median_subaccounts/new
  def new
    @median_subaccount = MedianSubaccount.new
  end

  # GET /median_subaccounts/1/edit
  def edit
  end

  # POST /median_subaccounts
  # POST /median_subaccounts.json
  def create
    @median_subaccount = MedianSubaccount.new(median_subaccount_params)

    respond_to do |format|
      if @median_subaccount.save
        format.html { redirect_to @median_subaccount, notice: 'Median subaccount was successfully created.' }
        format.json { render :show, status: :created, location: @median_subaccount }
      else
        format.html { render :new }
        format.json { render json: @median_subaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /median_subaccounts/1
  # PATCH/PUT /median_subaccounts/1.json
  def update
    respond_to do |format|
      if @median_subaccount.update(median_subaccount_params)
        format.html { redirect_to @median_subaccount, notice: 'Median subaccount was successfully updated.' }
        format.json { render :show, status: :ok, location: @median_subaccount }
      else
        format.html { render :edit }
        format.json { render json: @median_subaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /median_subaccounts/1
  # DELETE /median_subaccounts/1.json
  def destroy
    @median_subaccount.destroy
    respond_to do |format|
      format.html { redirect_to median_subaccounts_url, notice: 'Median subaccount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_median_subaccount
      @median_subaccount = MedianSubaccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def median_subaccount_params
      params.require(:median_subaccount).permit(:company_id, :subaccount_id, :dev_mode, :request_permission, :request_permission_text, :excluded_selectors, :phone_mode)
    end
end
