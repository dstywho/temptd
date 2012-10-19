class Vote < ActiveRecord::Base
  attr_accessible :event_id, :timeslot_id, :user_id
  belongs_to user
  belongs_to event
  belongs_to timeslot
end
