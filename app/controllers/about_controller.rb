class AboutController < ApplicationController
  def index
    @time_now = Time.now
    @count = rand(30)

    @user = User.new(email: 'malformed')
    @user.valid?
  end
end
