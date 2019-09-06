class StationCategoriesController < ApplicationController
  before_action :set_station_category, only: [:edit, :update, :show, :destroy]

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
      redirect_to course_path(@station_category.course)
    else
      render 'new'
    end
  end

  def update
    if @station_category.update(station_category_params)
      flash[:success] = "Station category was successfully updated."
      redirect_to course_path(@station_category.course)
    else
      render "edit"
    end
  end

  def show
  end

  private
  def station_category_params
    params.require(:station_category).permit(:name, :course_id)
  end

  def set_station_category
    @station_category = StationCategory.find(params[:id])
  end

end
