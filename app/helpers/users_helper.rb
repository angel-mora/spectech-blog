module UsersHelper
  def votes?
    @article.votes.where(author_id: id).any?
  end
end
