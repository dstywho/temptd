class Event < ActiveRecord::Base
  attr_accessible :type
  has_many        :timeslots
  has_many        :votes
  belongs_to      :event_type

  def calculate_event_details
    calculate_event_time
  end
  def calculate_event_time
    timeslots.all(order: votes).first
  end
end
