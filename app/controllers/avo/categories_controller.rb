# frozen_string_literal: true

module Avo
  class CategoriesController < Avo::ResourcesController
    before_action :authorize!
    after_action :verify_authorized

    def authorize!
      authorize(Category)
    end
  end
end
