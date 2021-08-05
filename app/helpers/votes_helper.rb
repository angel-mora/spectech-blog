module VotesHelper
  def vote_button(article)
    # binding.pry
    vote = Vote.find_by(author: @current_user, article: article)
    if vote
      link_to('Unvote', article_vote_path(id: vote.id, article_id: article.id),
              method: :delete)
    else
      link_to('Vote', article_vote_path(article), method: :post)
    end
  end
end
