# This controller has been generated to enable Rails' resource routes.
# More information on https://docs.avohq.io/2.0/controllers.html
class Avo::UsersController < Avo::ResourcesController
  before_action :authorize!
  after_action :verify_authorized
  def authorize!
    authorize(User)
  end
end
