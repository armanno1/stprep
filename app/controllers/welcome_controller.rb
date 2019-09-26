class WelcomeController < ApplicationController
  layout 'welcome'

  def index
    @courses = Course.all
  end
end
