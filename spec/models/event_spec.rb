require 'spec_helper'

describe Event do
  before :all do
    @vote1 = Vote.create
    @vote2 = Vote.create
    @vote3 = Vote.create
    @timeslot1 = Timeslot.new(starts_at: Time.now + 3.hours)
    @timeslot2 = Timeslot.new(starts_at: Time.now + 1.hours)
    @event = Event.new(timeslots: [@timeslot1, @timeslot2])
  end

  it "calculates the most popular time" do
    @timeslot1.votes = [@vote1, @vote2]
    @timeslot2.votes << @vote3
    
    # This method looks in the database
    @event.winning_timeslot.should == @timeslot1
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