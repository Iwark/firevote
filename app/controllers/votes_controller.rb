class VotesController < ApplicationController

  # AJAX
  def create
    @vote = Vote.find_by(user_id: current_user.id) || Vote.new(vote_params)
    @vote.user = current_user
    @vote.team_id = vote_params[:team_id]
    @vote.comment = vote_params[:comment]
    @vote.save if !@vote.team || @vote.team.name != current_user.team.name
  end

  private
  def vote_params
    params.require(:vote).permit(:team_id, :comment)
  end
end