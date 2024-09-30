# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  # private

  # def authorize_admin!
  #   return if current_user.is_admin

  #   redirect_to root_url, notice: t("admin.unauthorized")
  # end
end
