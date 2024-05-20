# frozen_string_literal: true

module Admin
  class InsurancesController < ApplicationController
    def new
      @insurance = Insurance.new
    end

    def create
      @insurance = Insurance.new(insurance_params)
      if @insurance.save
        redirect_to [:insurances, @insurances], notice: t("admin.insurances.created")
      else
        render :new
      end
    end

    private

    def insurance_params
      params.require(:insurance).permit(:name, :price_cents)
    end
  end
end
