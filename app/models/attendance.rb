class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id,
    uniqueness: true

  after_create :confirmation_send

  def confirmation_send
    AttendanceMailer.confirmation_email(self).deliver_now
  end
end
