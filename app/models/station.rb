class Station < ApplicationRecord
  belongs_to :course
  has_many :questions
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :scenario, presence: true
  validates :answer, presence: true
  validates :course_id, presence: true
end
