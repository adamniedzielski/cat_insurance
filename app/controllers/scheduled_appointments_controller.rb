# frozen_string_literal: true

class ScheduledAppointmentsController < ApplicationController
  def create
    @scheduled_appointment = ScheduledAppointment.new(scheduled_appointment_params)
    @scheduled_appointment.user = current_user
    @scheduled_appointment.vet = Vet.find(params[:vet_id])
    if @scheduled_appointment.save
      redirect_to vet_path(@scheduled_appointment.vet), notice: t("vet.scheduled_appointment.create")
    else
      redirect_to vets_path
    end
  end

  private

  def scheduled_appointment_params
    params.require(:scheduled_appointment).permit(:date)
  end
end
