# frozen_string_literal: true

module Api
  class InsurancesController < ApplicationController
    def index
      @insurances = Insurance.all
      render json: @insurances
    end
  end
end
