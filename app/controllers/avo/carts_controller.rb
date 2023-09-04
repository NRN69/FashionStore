# frozen_string_literal: true

module Avo
  class CartsController < Avo::ResourcesController
    before_action :authorize!
    after_action :verify_authorized

    def authorize!
      authorize(Cart)
    end
  end
end
