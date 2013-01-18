module ApplicationHelper
  
  def display_winning_time(event)
    if event.winning_timeslot
      event.winning_timeslot.to_s
    else
      "None"
    end
  end
end
