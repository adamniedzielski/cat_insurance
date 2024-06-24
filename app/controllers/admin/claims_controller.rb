# frozen_string_literal: true

module Admin
  class ClaimsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    def index
      @claims = Claim.includes(subscription: :insurance).all
    end

    def edit
      @claim = Claim.find(params[:id])
    end

    def update
      @claim = Claim.find(params[:id])
      if @claim.update(claim_params)
        redirect_to admin_claims_path, notice: t("subscriptions.update_claim")
      else
        render :edit
      end
    end

    private

    def claim_params
      params.require(:claim).permit(:status)
    end

    def authorize_admin!
      return if current_user.is_admin

      redirect_to root_url, notice: t("admin.unauthorized")
    end
  end
end
