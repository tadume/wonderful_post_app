class ArticlesController < ApplicationController

  #GET/articles
  def index
    @articles = Article.all
  end

  #GET/articles/1
  def show
    @article = Article.find(params[:id])
  end

  #GET/articles/new
  def new
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status:unprocessable_entitiy
    end
  end

  #POST/articles
  def create

  end

  #PATCH/articles/1
  def update
  end

  #DELETE/articles/1
  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

end
