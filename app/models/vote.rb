class Vote < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :article
  validates :author_id, uniqueness: { scope: :article_id }

  enum selectable_vote_types: %i[downvote upvote]

  def vote_button(article)
    # return unless user_signed_in?

    # if current_user.voted?(article)
    #   link_to('', "/articles/#{article.id}/unvote", method: :patch, class: '')
    # else
    #   link_to('', "/articles/#{article.id}/vote", method: :post, class: '')
    # end
  end
end
