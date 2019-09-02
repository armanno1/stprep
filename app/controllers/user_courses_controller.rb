class UserCoursesController < ApplicationController
  def create
    course = Course.find_by_id(params[:course])
    if has_course(current_user, course)
      flash[:danger] = "You are already signed up to that course"
      redirect_to course_path(course)
    elsif @user_course = UserCourse.create(user: current_user, course: course)
      flash[:success] = "Signed up for course #{@user_course.course.title}"
      redirect_to course_path(@user_course.course)
    else
      flash[:danger] = "error"
      render 'new'
    end
  end
  private
  def has_course(user, course)
    user.courses[course.id]
  end
end
