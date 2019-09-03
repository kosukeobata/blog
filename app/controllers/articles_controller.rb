class ArticlesController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5).search(params[:search]).order(id: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @recent_list = Article.where('id != ?', params[:id]).order(id: :desc).limit(3)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if params.require(:article)[:password] == "StringZero"
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id]) 

    if params.require(:article)[:password] == "StringZero"
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end


def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

  private
  def article_params
      params.require(:article).permit(:title, :text)
  end

end
