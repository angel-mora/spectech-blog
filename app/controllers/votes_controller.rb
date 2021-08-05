class VotesController < ApplicationController
  before_action :set_current_user

  def create
    @vote = @current_user.votes.new(article_id: params[:article_id])
    redirect_to request.referrer, notice: 'You voted for an article' if @vote.save
  end

  def destroy
    @vote = Vote.find_by(id: params[:id], author: @current_user, article_id: params[:article_id])
    redirect_to request.referrer, notice: 'You unvoted an article' if @vote.destroy
  end
end
