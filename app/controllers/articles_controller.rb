class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :show, :destory]

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.create!(article_params)

    render :show
  end

  def update
    @article.update!(article_params)

    render :show
  end

  def destroy
    @article.destroy!

    render :show
  end

  private
  def article_params
    params[:article].permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
