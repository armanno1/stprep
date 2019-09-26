class WelcomeController < ApplicationController
  layout 'welcome'

  def index
    @courses = Course.all
    @transparent_nav = true
  end
end
