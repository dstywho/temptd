class VotesController < ApplicationController

  def create
    timeslot = Timeslot.find(params[:timeslot_id])
    @vote = timeslot.votes.new(user: current_user, event: timeslot.event)
    
    if @vote.save
      redirect_to @vote.event, notice: 'Thanks for voting!'
    else
      redirect_to @vote.event, notice: 'Dang, your vote didn\'t work :('
    end
  end


  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to @vote.event
  end
end
