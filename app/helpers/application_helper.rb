module ApplicationHelper
  def has_course(user, course)
    if user && user.courses.find_by_id(course.id)
      return true
    else
      return false
    end
  end
end
