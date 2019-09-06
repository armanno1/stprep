class StationsController < ApplicationController
  before_action :set_station, only: [:edit, :update, :show, :destroy]
  before_action :check_user_has_station, only: [:show]
  attr_accessor :course_id

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def show
    if @station.questions.any?
      @questions = @station.questions
    elsif current_user.admin?
      flash[:danger] = "This station has no questions: write a question for it now"
      redirect_to new_question_path(@station)
    else
      flash[:danger] = "This station hasn't got any questions yet..."
      redirect_to courses_path(@station.course)
    end
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:success] = "Station created!"
      redirect_to station_path(@station)
    else
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

  private
  def station_params
    params.require(:station).permit(:title, :description, :scenario, :course_id)
  end

  def set_station
    @station = Station.find(params[:id])
  end

  def check_user_has_station
    parent_course = @station.course.id if @station.course
    if current_user.courses.find_by_id(parent_course).nil?
      flash[:danger] = "You are not subscribed to a course with this station"
      redirect_to courses_path
    end
  end

end
