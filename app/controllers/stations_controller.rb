class StationsController < ApplicationController
  before_action :set_station, only: [:edit, :update, :show, :destroy]
  attr_accessor :course_id

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def show
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

  private
  def station_params
    params.require(:station).permit(:title, :description, :scenario, :answer, :course_id)
  end
  def set_station
    @station = Station.find(params[:id])
  end
end
