class Articles::VotesController < ApplicationControllers
  def create
    @article.votes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @article }

      format.js
    end
  end

  private

  def set_article
    @article = article.find(params[:article_id])
  end
end
