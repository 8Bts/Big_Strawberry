module CategoriesHelper
  def category_last(category)
    category.articles.last if category.articles.exists?
  end

  def category_last_img(category)
    if category_last(category)
      category_last(category).image
    else
      Article.no_articles_img
    end
  end

  def category_last_title(category)
    if category_last(category)
      category_last(category).title
    else
      'This Category Has No Posts'
    end
  end

  def category_last_id(category)
    category_last(category)&.id
  end

  def category_link(category)
    category_path(category.id) if category_last(category)
  end
end
