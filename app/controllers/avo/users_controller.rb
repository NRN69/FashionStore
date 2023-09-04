# frozen_string_literal: true

module Avo
  class UsersController < Avo::ResourcesController
    before_action :authorize!
    after_action :verify_authorized

    def authorize!
      authorize(User)
    end
  end
end
