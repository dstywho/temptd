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
    timeslot = votes.select("votes.*, count(*) AS count").
                     group(:timeslot_id).
                     order("count DESC").
                     limit(1).try(:timeslot)
    
    timeslot ? [timeslot.starts_at, timeslot.end_at] : nil
  end
  
  
  
  # 5.times do |day_index|
  #   day = monday + day_index.days
  #   2.times do |i|
  #     start_time = day + (17 + i * 2).hours 
  #     end_time = day + (19 + i * 2).hours 
  # 
  #     Timeslot.create(event_id: test_event.id, starts_at: start_time, ends_at: end_time)
  #   end
  # end
  
  
  def self.start_new_sports_event
    # Event.
  end
  
  def self.finish_current_sports_event
    
  end
  
end
