class Vote < ActiveRecord::Base
  attr_accessible :event_id, :timeslot_id, :user_id
end
