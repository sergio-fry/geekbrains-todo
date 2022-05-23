class AboutController < ApplicationController
  def index
    I18n.locale = cookies[:locale] || I18n.default_locale
    @time_now = Time.now
  end
end
