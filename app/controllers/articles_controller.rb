class ArticlesController < ApplicationController
  before_action :set_variables, only: %i[show edit update destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @user = User.find(session[:current_user])
    @article = @user.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @user = User.find(session[:current_user])
    @article = @user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        @article.categories << Category.find(article_params[:category_id])
        format.html { redirect_to category_path(article_params[:category_id]), notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        @article.categories.destroy_all
        @article.categories << Category.find(article_params[:category_id])
        format.html { redirect_to category_path(article_params[:category_id]), notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_variables
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end
end
