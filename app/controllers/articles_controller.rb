class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :show, :destory]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Ariticle.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
