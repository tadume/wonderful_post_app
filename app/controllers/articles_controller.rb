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
    @article = Article.new
  end

  #GET/article/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  #POST/articles
  def create

  end

  #PATCH/articles/1
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
     redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #DELETE/articles/1
  def destroy
  end

  private
    def article_params
     params.require(:article).permit(:title, :content)
    end

end
