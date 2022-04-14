class User < ApplicationRecord
  validates :name, length: { maximum: 100 }, presence: true

  scope :admins, -> { where(role_id: Role.find_by(code: 'user')) }

  store :settings, accessors: [:notifications, :site], coder: JSON, prefix: :settings

  # validates :site, presence: true

  # enum :state, [:initial, :active, :suspended] # do not use please
  enum :state, { active: 1, suspended: 2 }

  belongs_to :role
  has_one :profile
  has_many :events
  has_many :items, through: :events
end
