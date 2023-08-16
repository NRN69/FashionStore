# frozen_string_literal: true

# This controller has been generated to enable Rails' resource routes.
# More information on https://docs.avohq.io/2.0/controllers.html
module Avo
  class ProductsController < Avo::ResourcesController
    before_action :authorize!
    after_action :verify_authorized

    def authorize!
      authorize(Product)
    end

    def index
      return unless current_user

      current_user.notifications.mark_as_read!
      @notifications = current_user.notifications.reverse
    end
  end
end
