module CategoriesHelper
  def category_last(category)
    if category.articles.exists?
      return category.articles.last
    else
      nil
    end
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
    if category_last(category)
      category_last(category).id
    else
      nil
    end
  end

  def category_link(category)
    if category_last(category)
      category_path(category.id)
    else
      nil
    end
  end   
end
