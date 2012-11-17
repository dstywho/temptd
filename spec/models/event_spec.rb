require 'spec_helper'

describe Event do
  
  it "should calculate_event_time" do
    
  end
  
  describe "#start_new_sports_event" do
    
    describe "should create new event"
      expect { Event.start_new_sports_event }.to
        change { Event.count }.by(1)
    end
    
  
  end
  
  
end


