require 'spec_helper'

describe "votes/edit" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :user_id => 1,
      :event_id => 1,
      :timeslot_id => 1
    ))
  end

  it "renders the edit vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path(@vote), :method => "post" do
      assert_select "input#vote_user_id", :name => "vote[user_id]"
      assert_select "input#vote_event_id", :name => "vote[event_id]"
      assert_select "input#vote_timeslot_id", :name => "vote[timeslot_id]"
    end
  end
end
