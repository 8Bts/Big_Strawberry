module ArticlesHelper
  def featured_article
    Article.includes(:votes).all.max { |a, b| a.votes.count <=> b.votes.count }
  end

  def featured_img
    if featured_article
      featured_article.image
    else
      Article.no_articles_img
    end
  end

  def featured_title
    if featured_article
      featured_article.title
    else
      'No Featured Posts So Far'
    end
  end

  def featured_id
    featured_article&.id
  end

  def edit_btn(article)
    render 'articles/edit_button', article: article if article.author_id == session[:current_user]
  end

  def delete_btn(article)
    render 'articles/delete_button', article: article if article.author_id == session[:current_user]
  end  
end
