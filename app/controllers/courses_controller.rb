class CoursesController < ApplicationController
  before_action :require_admin, only: [:create, :update, :destroy]
  before_action :set_course, only: [:edit, :update, :show, :destroy]

  def my_courses
    if user_signed_in? && current_user.courses.any? && !current_user.admin
      @courses = current_user.courses.all
    elsif user_signed_in? && current_user.admin
      @courses = Course.all
    else
      flash[:danger] = "You have no courses!"
      redirect_to courses_path
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
    if @course.update(course_params)
      flash[:success] = "Course was successfully updated."
      redirect_to course_path(@course)
    else
      render "edit"
    end
  end

  def show
    @course_stations = @course.stations.all if @course.stations
  end

  def destroy
    course = Course.find(params[:id])
    if course.destroy
      flash[:success] = "Course has been deleted"
      redirect_to my_courses_path
    else
      flash[:danger] = "Problem deleting course"
      redirect_to my_courses_path
    end
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
