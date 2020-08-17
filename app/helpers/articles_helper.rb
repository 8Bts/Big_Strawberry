module ArticlesHelper
  def featured_article
    Article.includes(:votes).all.max do |a, b|
      a.votes.count <=> b.votes.count
    end
  end

end
