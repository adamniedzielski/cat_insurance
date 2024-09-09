# frozen_string_literal: true

class PrescriptionsController < ApplicationController
  def new
    @user = current_user
    @vet = Vet.find(params[:vet_id])
    @prescription = @vet.prescriptions.build
  end

  def create
    @vet = Vet.find(params[:vet_id])
    @prescription = @vet.prescriptions.build(prescription_params)
    @prescription.user = current_user

    if @prescription.save
      redirect_to vet_path(@vet), notice: t("vet.prescription")
    else
      render :new
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:medicine_name)
  end
end
