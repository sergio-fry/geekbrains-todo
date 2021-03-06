class Event < ApplicationRecord
  validates :name, presence: true

  scope :recent, -> { order("created_at DESC").limit(10) }
  scope :finished, -> { where(done: true) }
  scope :finished_after, ->(dt) { finished.where("finished_at > ?", dt) }
  scope :finished_today, -> { finished_after(Time.now.beginning_of_day) }

  # do not use please
  # default_scope -> { where('created_at < ?', Time.now) }

  belongs_to :user, -> { where(state: :active) }
  has_many :items, dependent: :destroy

  has_many :comments, as: :commentable

  has_and_belongs_to_many :tags
end
