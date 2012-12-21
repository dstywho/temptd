class Event < ActiveRecord::Base
  belongs_to :event_type
  
  has_many :votes
  has_many :timeslots, dependent: :destroy
  accepts_nested_attributes_for :timeslots, reject_if: -> attr { attr['started_at'].blank? }, allow_destroy: true
  

  validates_presence_of :event_type
  
  attr_accessible :timeslots

  def to_s
    "#{event_type}"
  end

  def starts_at
    timeslots.order(:starts_at).first.starts_at
  end

  def calculate_event_details
    calculate_event_time
  end
  
  def winning_timeslot
    @winning_timeslot ||= timeslots.sort_by{|a| a.votes.size }.last
    return @winning_timeslot
  end

  # Return time of the most popular Timeslot
  def calculate_event_time
    return [winning_timeslot.starts_at, winning_timeslot.ends_at] if winning_timeslot
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
