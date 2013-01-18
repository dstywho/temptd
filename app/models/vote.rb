class Vote < ActiveRecord::Base
  attr_accessible :event_id, :timeslot_id, :user_id, :user, :timeslot, :event
  
  belongs_to :user
  belongs_to :event
  belongs_to :timeslot
  
  validates_presence_of :timeslot
  validates_presence_of :user
  validates_uniqueness_of :timeslot_id, scope: :user_id
end
