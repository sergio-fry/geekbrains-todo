class LocalesController < ApplicationController
  def switch
    cookies[:locale] = params[:locale]
    redirect_back fallback_location: root_path
  end
end
