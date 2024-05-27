# frozen_string_literal: true

class SubscriptionMailer < ApplicationMailer
    def success_subscription
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end    
end
