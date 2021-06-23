module ApplicationHelper
  def categories_menu(categories)
    categories_displayed = ''
    categories.each do |category|
      categories_displayed << content_tag(:li, link_to(category.name.upcase, category_path(category),
                                                       class: 'simple-list'))
    end
    categories_displayed.html_safe
  end
end
