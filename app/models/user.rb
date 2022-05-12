class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 100 }, presence: true

  validates :email, uniqueness: true

  scope :admins, -> { where(role_id: Role.find_by(code: 'user')) }

  store :settings, accessors: [:notifications, :site], coder: JSON, prefix: :settings

  # validates :site, presence: true

  # enum :state, [:initial, :active, :suspended] # do not use please
  enum :state, { active: 1, suspended: 2 }

  belongs_to :role

  has_one :profile
  has_many :events
  has_many :items, through: :events

  has_many :comments, as: :commentable

  has_many :reviews, class_name: "Comment", through: :events, source: :comments

  before_validation :set_default_role

  after_create -> { logger.info "Created" }
  after_save -> { logger.info "Saved" }

  # after_save -> { logger.info "Created" }, if: -> { role.code == 'admin' }
  # after_save -> { logger.info "Created" }, only: [:created]

  around_save :save_wrapper

  after_find :set_load_time

  attr_reader :load_time

  before_save :check_freshness

  def fancy_role
    "Fancy role '#{role.code}'"
  end

  private

  def check_freshness
    return true unless persisted?

    if load_time < 1.seconds.ago
      raise ActiveRecord::RecordInvalid
    end
  end

  def set_load_time
    @load_time = Time.now
    Rails.logger.debug "Set load time: #{@load_time}"
  end


  def save_wrapper
    logger.info "Before save"

    yield

    logger.info "After save"
  end

  def log_creation
    puts 12
  end

  def set_default_role
    self.role ||= Role.find_by code: :user
  end
end
