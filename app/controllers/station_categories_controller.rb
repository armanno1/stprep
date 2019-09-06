class StationCategoriesController < ApplicationController
  def index
    @station_categories = StationCategory.all
  end

  def new
    @station_category = StationCategory.new
  end

  def create
    @station_category = StationCategory.new(station_category_params)
    if @station_category.save
      flash[:success] = "Station category was created successfully"
      redirect_to station_categories_path
    else
      render 'new'
    end
  end

  def show
  end

  private
  def station_category_params
    params.require(:station_category).permit(:name, :course_id)
  end

end
