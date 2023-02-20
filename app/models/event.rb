class Event < ApplicationRecord

  validates :start_date,
  presence: true,
  comparison: { greater_than: Time.now}

  validates :duration,
  presence: true,
  numericality: { divisible_by: 5 }

  validates :title,
  presence: true,
  length: { in: 5..140 }

  validates :description,
  presence: true,
  length: { in: 20..1000 }

  validates :price,
  presence: true,
  numericality: { in: 1..1000 }

  validates :location,
  presence: true

  has_many :attendances
  belongs_to :admin, class_name: "User"
  has_many :users, through: :attendances
end
