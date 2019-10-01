class Station < ApplicationRecord
  belongs_to :course
  belongs_to :station_category
  has_many :questions, dependent: :destroy
  has_many :station_categories
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :scenario, presence: true
  validates :course_id, presence: true
  validates :station_category_id, presence: true

  has_many :favorite_stations # just the 'relationships'
  has_many :completed_by_users, through: :favourite_stations, source: :user # the actual users favoriting a recip
end
