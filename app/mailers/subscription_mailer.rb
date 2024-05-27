# frozen_string_literal: true

class SubscriptionMailer < ApplicationMailer
  def success_subscription
    @user = params[:user]
    mail(to: @user.email, subject: t("subscriptions.success_mailer_header"))
  end
end
