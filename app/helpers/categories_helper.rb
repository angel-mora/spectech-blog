module CategoriesHelper
  def article_by_category(category)
    return unless category.articles.any?

    link_title = category.articles.pluck(:title).last.truncate(19)
    article = category.articles.last
    link_to(link_title, article_path(article), class: 'simple-link top-title m-2 p-2')
  end
end
