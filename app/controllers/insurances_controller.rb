class InsurancesController < ApplicationController
  def index
    @insurances = Insurance.all
  end

  def show
    @insurance = Insurance.find(params.fetch(:id))
  end

end
