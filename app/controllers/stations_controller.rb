class StationsController < ApplicationController
  before_action :set_station, only: [:edit, :update, :show, :destroy, :complete]
  before_action :check_user_has_station, only: [:show]
  attr_accessor :course_id

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
    course = Course.find_by_id(params[:course_id]) if params[:course_id]
    if params[:course_id] && !course.station_categories.any?
      flash[:danger] = "#{course.title} doesn't have any station categories, create one:"
      redirect_to new_station_category_path
    end
  end

  def show
    @questions = @station.questions if @station.questions.any?
    stations = Array.new(@station.station_category.stations)
    current_position_id = stations.find_index(@station)
    @next_station = stations[current_position_id + 1] if stations[current_position_id + 1]
  end

  def create
    @station = Station.new(station_params)
    course = Course.find_by_id(station_params[:course_id])
    if @station.save
      flash[:success] = "Station created!"
      redirect_to course_path(@station.course)
    else
      @course = course
      render 'new'
    end
  end

  def update
    if @station.update(station_params)
      flash[:success] = "Station was successfully updated."
      redirect_to station_path(@station)
    else
      render "edit"
    end
  end

  def destroy
    station = Station.find(params[:id])
    if station.destroy
      flash[:success] = "Station has been deleted"
      redirect_to course_path(station.course)
    else
      flash[:danger] = "Problem deleting station"
      redirect_to course_path(station.course)
    end
  end

  def complete
    type = params[:type]
    if type == "1"
      @completed = "Completed"
      current_user.completed_stations << @station
      respond_to do |format|
        format.js
      end
    elsif type == "0"
      current_user.completed_stations.delete(@station)
      @completed = "Incomplete"
      respond_to do |format|
        format.js
      end
    else
      render js: "alert('error');"
    end
  end


  private
  def station_params
    params.require(:station).permit(:title, :description, :scenario, :course_id, :station_category_id)
  end

  def set_station
    @station = Station.find(params[:id])
  end

  def check_user_has_station
    parent_course = @station.course.id if @station.course
    if !user_signed_in? || current_user.courses.find_by_id(parent_course).nil?
      flash[:danger] = "You are not subscribed to a course with this station"
      redirect_to courses_path
    end
  end

end
