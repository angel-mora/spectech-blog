module VotesHelper
  def user_voted?(current_user, article)
    # return unless current_user

    if Vote&.find_by(id: current_user.id, article_id: article.id).present?
      link_to 'Unvote', category_article_vote_path(@category, @article), method: :delete
    else
      link_to 'Vote', category_article_vote_path(@category, @article), method: :post
    end
  end
end
