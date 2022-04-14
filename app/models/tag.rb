class Tag < ApplicationRecord
  has_and_belongs_to_many :events
  validates :name, presence: true
end
