class Event < ActiveRecord::Base
  attr_accessible :type
  has_many        :timeslots
  has_many        :votes
  belongs_to      :event_type
end
