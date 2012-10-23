class Event < ActiveRecord::Base
  attr_accessible :type
  has_many        :timeslots
  has_many        :votes
  belongs_to      :event_type
  
  validates_presence_of :event_type
  
  def to_s
    "#{event_type}"
  end

  def starts_at
    timeslots.order(:starts_at).first.starts_at
  end

  def calculate_event_details
    calculate_event_time
  end
  
  def calculate_event_time
    timeslots.all(order: votes).first
  end
end
