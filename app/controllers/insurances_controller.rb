class InsurancesController < ApplicationController
  def index
    @insurances = Insurance.all
  end
end
