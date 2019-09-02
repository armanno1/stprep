class CourseStation < ApplicationRecord
  belongs_to :course
  belongs_to :station
end
