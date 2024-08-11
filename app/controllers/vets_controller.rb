# frozen_string_literal: true

class VetsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @vets = Vet.all
  end

  def show
    @vet = Vet.find(params[:id])
    @insurance = @vet.insurance
  end

  def update
    @vets = Vet.find(params[:id])
    if @vets.update(vet_params)
      redirect_to vets_path, notice: t("vet.appointment")
    else
      render :index
    end
  end

  private

  def vet_params
    params.require(:vet).permit(:name, :available_date, :scheduled_appointment)
  end

  def authorize_admin!
    return if current_user.is_admin

    redirect_to root_url, notice: t("admin.unauthorized")
  end
end
