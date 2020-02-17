class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"

  validates :start_date,
    presence: true,

  validates :duration,
    presence: true,
    numericality: { only_integer: true }
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
  
  def duration_must_be_multiple_of_five
    unless duration % 5 == 0
        errors.add(:duration, "must be multiple of 5")
    end
  end
  
end
