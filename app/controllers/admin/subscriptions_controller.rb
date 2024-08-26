# frozen_string_literal: true

module Admin
  class SubscriptionsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    def index
      @subscription = Subscription.all
    end

    private

    def authorize_admin!
      return if current_user.is_admin

      redirect_to root_url, notice: t("admin.unauthorized")
    end
  end
end
