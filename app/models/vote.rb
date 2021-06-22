class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def vote_button(article)
    return unless user_signed_in?

    if current_user.voted?(article)
      link_to('', "/articles/#{article.id}/unvote", method: :patch, class: '')
    else
      link_to('', "/articles/#{article.id}/vote", method: :post, class: '')
    end
  end
end
