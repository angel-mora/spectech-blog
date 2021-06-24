module ArticlesHelper
  def top_title(article)
    article.try(:title)
  end

  def top_image(article)
    url_for(article.try(:image).blob)
  end

  def top_content(article)
    article.try { |a| a.text.truncate(100, separator: ' ', omission: '... Read more') }
  end

  def number_of_comments(article)
    pluralize(article.comments.size, 'comment')
  end

  def number_of_votes(article)
    pluralize(article.votes.size, 'vote')
  end

  def author_name(article)
    article.user.name
  end

  def latest_article_cover(category)
    return if category.try(:articles).nil?

    img_blob = category.articles.last.image.blob
    url_for(img_blob)
  end

  def top_title_link(article)
    link_to(top_title(article), article_path(article), class: 'simple-link top-title m-2 p-2') if article
  end
end
