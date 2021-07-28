module ArticlesHelper
  def top_title(_category, article)
    article.try(:title)
  end

  def top_image(article)
    url_for(article.try(:image).blob)
  end

  def top_content(article)
    article.try { |a| a.text.truncate(100, separator: ' ', omission: '... Read more') }
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

  def top_title_link(category, article)
    if article
      link_to(top_title(category, article), category_article_path(category, article),
              class: 'simple-link top-title m-2 p-2')
    end
  end
end
