# frozen_string_literal: true

module Avo
  class ProductsController < Avo::ResourcesController
    before_action :authorize!
    after_action :verify_authorized

    def authorize!
      authorize(Product)
    end
  end
end
