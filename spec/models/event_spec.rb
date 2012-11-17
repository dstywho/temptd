require 'spec_helper'

describe Event do
  before :all do

    vote1 = Vote.new
    vote2 = Vote.new
    vote3 = Vote.new
    timeslot1 = Timeslot.new
    timeslot2 = Timeslot.new
    event = Event.new(timeslots: [timeslot1, timeslot2])
  end
  
  it "calculates the most popular time" do
    timeslot1.votes = [vote1, vote2]
    timeslot2.vote = vote3
    event.calculate_event_time.should_be timeslot2

  end


  it "should calculate_event_time" do
    
  end
  
  describe "#start_new_sports_event" do
    
    # describe "should create new event"
    #   expect { Event.start_new_sports_event }.to
    #     change { Event.count }.by(1)
    # end
    
  
  end
  
  
end


