# frozen_string_literal: true

class InsurancesController < ApplicationController
  def index
    @insurances = Insurance.all
    @insurances = @insurances.where(price_cents: params[:min_price].to_i..) if params[:min_price].present?
    @insurances = @insurances.where(price_cents: ..params[:max_price].to_i) if params[:max_price].present?
  end

  def show
    @insurance = Insurance.find(params.fetch(:id))
    @subscription = Subscription.new(insurance: @insurance)
  end
end
