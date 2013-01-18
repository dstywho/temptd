class Timeslot < ActiveRecord::Base
  attr_accessible :event_id, :ends_at, :starts_at
  
  belongs_to :event
  has_many :votes, dependent: :destroy
  
  validates_presence_of :event_id, :starts_at
  
  def to_s
    range = starts_at.strftime("%A, %l%P")
    range << " - #{ends_at.strftime("%A, %l%P")}" if ends_at
    return range
  end
end
