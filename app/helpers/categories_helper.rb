module CategoriesHelper
  def article_by_category(category)
    return unless category.articles.any?

    link_title = category.articles.pluck(:title).last.truncate(19)
    article = category.articles.last
    link_to(link_title, article_path(article), class: 'simple-link top-title m-2 p-2')
  end

  def top_img(art, idx)
    img = ''
    img << image_tag(url_for(art.image.blob), class: 'half w-25vw bg-cover')
    img.html_safe if idx.odd?
  end

  def bottom_img(art, idx)
    img = ''
    img << image_tag(url_for(art.image.blob), class: 'half w-25vw bg-cover')
    img.html_safe if idx.even?
  end

  def read_more(art)
    art.try { |a| a.text.truncate(150, separator: ' ', omission: '... To be continued.') }
  end
end
