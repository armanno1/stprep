class Question < ApplicationRecord
  belongs_to :station
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :answer, presence: true, length: {minimum: 10, maximum: 300}
  validates :station_id, presence: true
end
