class Timeslot < ActiveRecord::Base
  attr_accessible :ends_at, :event_id, :starts_at
end
