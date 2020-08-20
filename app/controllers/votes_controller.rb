class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def create
    User.find(session[:current_user]).votes.create(vote_params)
    redirect_to request.referrer
  end

  def destroy
    Vote.find(params[:id]).destroy
    redirect_to request.referrer
  end

  private

  def vote_params
    params.require(:votes).permit(:author_id, :article_id)
  end
end
