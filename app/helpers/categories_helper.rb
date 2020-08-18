module CategoriesHelper
  def category_last(articles)
    if articles.exists?
      return articles.last
    else
      return Article.find(11)
    end
  end  
end
