class User < ApplicationRecord
  after_create :welcome_send
  
  has_many :attendances
  has_many :attendances, foreign_key: 'admin_id', class_name: "Attendance"
  has_many :events, through: :attendances

  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end
