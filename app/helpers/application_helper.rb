module ApplicationHelper
  def categories_menu(categories)
    categories_displayed = ''
    categories.each do |category|
      categories_displayed << link_to(category.name.upcase, category_path(category),
                                      class: 'd-flex align-items-center simple-link mx-4 px-4')
    end
    categories_displayed.html_safe
  end

  def markdown(text)
    options = %i[
      hard_wrap autolink no_intra_emphasis tables fenced_code_blocks
      disable_indented_code_blocks strikethrough lax_spacing space_after_headers
      quote footnotes highlight underline
    ]
    Markdown.new(text, *options).to_html.html_safe
  end
end
