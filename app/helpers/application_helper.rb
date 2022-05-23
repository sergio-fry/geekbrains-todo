module ApplicationHelper
  def another_locale
    cookies[:locale].to_sym == :en ? :ru : :en
  end
end
