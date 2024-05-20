class Admin::InsurancesController < ApplicationController
  def index
    @insurances = Insurance.all
  end

  def show
    @insurance = Insurance.find(params[:id])
  end

  def new
    @insurance = Insurance.new
  end

  def create
    @insurance = Insurance.new(insurance_params)
    if @insurance.save
      redirect_to [:insurances, @insurances], notice: 'Insurance was successfully created.'
    else
      render :new
    end
  end

  def edit
    @insurance = Insurance.find(params[:id])
  end

  def destroy
    @insurance = Insurance.find(params[:id])
    @insurance.destroy
    redirect_to admin_insurances_path, notice: 'Insurance was successfully deleted.'
  end

  def update
    @insurance = Insurance.find(params[:id])
    if @insurance.update(insurance_params)
      redirect_to admin_insurances_path, notice: 'Insurance was successfully updated.'
    else
      render :edit
    end
  end

  private

  def insurance_params
    params.require(:insurance).permit(:name, :price_cents)
  end
end
