class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations
  has_many :events, foreign_key: :creator_id

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def remember_me
    false
  end
end
