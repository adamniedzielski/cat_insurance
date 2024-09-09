# frozen_string_literal: true

module Admin
  class DiscountCodesController < ApplicationController
    before_action :authorize_admin!

    def index
      @discount_codes = DiscountCode.includes(:insurance).all
    end

    def new
      @insurances = Insurance.all
      @discount_code = DiscountCode.new
    end

    def create
      @insurances = Insurance.all
      @discount_code = DiscountCode.new(discound_code_params)
      if @discount_code.save
        redirect_to admin_discount_codes_path, notice: t("discount_code.create")
      else
        render :new
      end
    end

    private

    def discound_code_params
      params.require(:discount_code).permit(:discount_percentage, :code, :insurance_id)
    end
  end
end
