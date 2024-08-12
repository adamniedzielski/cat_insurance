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
    @scheduled_appointment = @vet.scheduled_appointments.build
  end

  private

  def authorize_admin!
    return if current_user.is_admin

    redirect_to root_url, notice: t("admin.unauthorized")
  end
end
