class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"

  validates :start_date,
    presence: true
  validate :event_must_be_upcoming
  validates :duration,
    presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validate :duration_must_be_multiple_of_five
  validates :title,
    presence: true,
    length: { in: 5..140 }
  validates :description,
    presence: true,
    length: { in: 20..1000 }
  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location,
    presence: true
  
  def event_must_be_upcoming
    if start_date.present?
      unless start_date > Time.now
        errors.add(:start_date, "must be upcoming")
      end
    end
  end
  
  def duration_must_be_multiple_of_five
    if duration.present?
      unless duration % 5 == 0
        errors.add(:duration, "must be multiple of 5")
      end
    end
  end

end

