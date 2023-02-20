class Attendance < ApplicationRecord
  after_create :notify_admin_send

  def notify_admin_send
    admin = self.event.admin
    user = self.user
    AdminEventMailer.notify_admin(admin, user).deliver_now
  end

  belongs_to :user
  belongs_to :event
end