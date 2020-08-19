module VotesHelper
  def vote_btn(article)
    return nil if session[:current_user].nil?
    user = User.find(session[:current_user])
    vote = user.votes.where(user_id: user.id, article_id: article.id).take
    if vote
      link_to 'Take Vote', vote_path(vote.id), method: 'delete', class: 'btn btn-warning btn-small'
    else
      link_to 'Vote', votes_path(user, votes: { user_id: user.id, article_id: article.id}), method: 'post',  class:'btn btn-primary btn-small'
    end  
  end

  def votes_text(votes)
    if votes.zero?
      nil
    elsif votes == 1
      '1 vote'
    else
      votes.to_s + ' votes'
    end
  end  
end
