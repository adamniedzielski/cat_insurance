# frozen_string_literal: true

module Admin
  class InsurancesController < ApplicationController
    def index
      @insurances = Insurance.all
    end

    def show
      @insurance = Insurance.find(params[:id])
    end

    def new
      @insurance = Insurance.new
    end

    def edit
      @insurance = Insurance.find(params[:id])
    end

    def create
      @insurance = Insurance.new(insurance_params)
      if @insurance.save
        redirect_to [:insurances, @insurances], notice: t("admin.insurances.created")
      else
        render :new
      end
    end

    def update
      @insurance = Insurance.find(params[:id])
      if @insurance.update(insurance_params)
        redirect_to admin_insurances_path, notice: t("admin.insurances.updated")
      else
        render :edit
      end
    end

    def destroy
      @insurance = Insurance.find(params[:id])
      @insurance.destroy
      redirect_to admin_insurances_path, notice: t("admin.insurances.deleted")
    end

    private

    def insurance_params
      params.require(:insurance).permit(:name, :price_cents)
    end
  end  
end
