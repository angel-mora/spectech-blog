class VotesController < ApplicationController
  before_action :set_current_user

  def create
    @vote = @current_user.votes.new(article_id: params[:article_id])
    redirect_to request.referrer, notice: 'You voted for an article' if @vote.save
  end

  def destroy
    @vote&.destroy
    redirect_to request.referrer, notice: 'You unvoted an article'
  end

  def vote_params
    params.require(:vote).permit(:author_id, :article_id, :vote_type)
  end
end
