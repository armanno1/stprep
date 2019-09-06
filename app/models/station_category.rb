class StationCategory < ApplicationRecord
  belongs_to :course
  has_many :stations
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :course_id, presence: true
end
