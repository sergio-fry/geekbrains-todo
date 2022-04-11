class User < ApplicationRecord
  validates :name, length: { maximum: 100 }, presence: true

  scope :admins, -> { where(role_id: Role.find_by(code: 'user')) }
end
