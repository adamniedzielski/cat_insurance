class InsurancesController < ApplicationController
  def index
    @insurances = Insurance.all
  end

  def show
    @insurance = Insurance.find(params.fetch(:id))
    @subscription = Subscription.new(insurance: @insurance)
  end

end
