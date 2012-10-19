class Timeslot < ActiveRecord::Base
  attr_accessible :event_id, :ends_at, :starts_at
  belongs_to :event
  has_many :votes
end
