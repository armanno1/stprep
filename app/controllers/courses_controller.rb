class CoursesController < ApplicationController
  before_action :require_admin, only: [:create, :update]
  before_action :set_course, only: [:edit, :update, :show, :destroy]

  def my_courses
    if !!current_user.courses.all
      @courses = current_user.courses.all
    else
      @no_courses = "You have no courses"
    end
  end

  def new
    @course = Course.new
  end

  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course has been successfully created"
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def update
  end

  def show
    @course_stations = @course.stations.all if !!@course.stations
  end

  private
  def require_admin
    if !current_user.admin?
      flash[:danger] = "You need to be an admin to do that"
      redirect_to courses_path
    end
  end
  def course_params
    params.require(:course).permit(:title, :description, :category, :price)
  end
  def set_course
    @course = Course.find(params[:id])
  end
end
