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
    @article = current_user.articles.new
  end

  #GET/article/1/edit
  def edit
    @article = current_user.articles.find(params[:id])
  end

  #POST/articles
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました。"

    else
      render :new, status: :unprocessable_entity
    end
  end

  #PATCH/articles/1
  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
     redirect_to @article, notice: "#{t('activerecord.models.article')}を編集しました。"

    else
      render :edit, status: :unprocessable_entity
    end
  end

  #DELETE/articles/1
  def destroy
    @article = current_user.articles.find(params[:id])
    redirect_to articles_url, notice:  "#{t('activerecord.models.article')}を削除しました。"
  end

  private
    def article_params
     params.require(:article).permit(:title, :content)
    end

end
