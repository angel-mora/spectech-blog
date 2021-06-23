module ApplicationHelper
  def categories_menu(categories)
    categories_displayed = ''
    categories.each do |category|
      categories_displayed << link_to(category.name.upcase, category_path(category), class: 'd-flex align-items-center simple-link')
    end
    categories_displayed.html_safe
  end
end
