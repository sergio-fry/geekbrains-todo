class AboutController < ApplicationController
  def index
    I18n.locale = params[:locale]
    @time_now = Time.now
  end
end
