class Event < ApplicationRecord
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations
  belongs_to :creator, class_name: "User"

  validates :title, :location, :description, presence: true
  validates :date , comparison: { greater_than: Date.today }

  scope :past, -> { where("date < ?", DateTime.now) }
  scope :future, -> { where("date > ?", DateTime.now) }
end
