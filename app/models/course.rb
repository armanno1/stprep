class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :stations, dependent: :destroy
  has_many :station_categories
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :price, presence: true, numericality: true
  validates :category, presence: true, length: {minimum: 1, maximum: 30}
end
