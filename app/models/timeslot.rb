class Timeslot < ActiveRecord::Base
  attr_accessible :ends_at, :event_id, :starts_at
  belongs_to :event
  has_many :votes
end
