class Event < ApplicationRecord
  enum status: { active: "active", removed: "removed" }

  belongs_to :category

  validates :name, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates :name, length: { minimum: 3, maximum: 100, allow_blank: true }
  validate :validate_if_starts_in_future, on: :create
  validate :validate_if_finished_greater_than_started

  scope :with_category, -> { includes(:category) }
  scope :today, -> { where(started_at: Date.current.beginning_of_day..Date.current.end_of_day) }
  scope :in_period, ->(period_start, period_end) { where("started_at >= ? AND started_at <= ?", period_start, period_end) }

  has_one_attached :file

  private

  def validate_if_finished_greater_than_started
    return unless started_at
    return unless finished_at
    return if finished_at > started_at

    errors.add(:finished_at, :invalid)
  end

  def validate_if_starts_in_future
    return unless started_at
    return if started_at >= Time.current

    errors.add(:started_at, :invalid)
  end
end