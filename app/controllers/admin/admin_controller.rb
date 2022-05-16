module Admin
  class AdminController < ApplicationController
    after_action :verify_authorized, except: :index
  end
end
