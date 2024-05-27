# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "nz.rahele@gmail.com"
  layout "mailer"
end
