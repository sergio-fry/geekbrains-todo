module ApplicationHelper
  def another_locale
    (session[:locale] || I18n.default_locale).to_sym == :en ? :ru : :en
  end
end
