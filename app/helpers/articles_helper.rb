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
    if featured_article
      featured_article.id
    else
      nil
    end
  end

end
