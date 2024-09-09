# frozen_string_literal: true

module Admin
  class SubscriptionsController < ApplicationController
    before_action :authorize_admin!

    def index
      @subscription = Subscription.all
    end
  end
end
