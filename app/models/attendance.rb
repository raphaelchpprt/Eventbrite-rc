class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id,
    uniqueness: true

  after_create :confirmation_send

  def confirmation_send
    UserMailer.welcome_email(self).deliver_now
  end
end
