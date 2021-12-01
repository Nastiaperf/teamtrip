class VotesController < ApplicationController
  def create
    suggestion = Suggestion.find(params[:suggestion_id])
    new_vote = Vote.new(suggestion: suggestion, user: current_user)
    new_vote.save!
    # REDIRECT
  end

  def destroy
    vote = Vote.find(param[:vote_id])
    vote.destroy!
    # REDIRECT
  end
end
