class ArticlesController < ApplicationController
  #Authentication
  before_action :authenticate_author!, except: [:index, :show]
  before_action :correct_author, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all.order("created_at DESC")
  end

  # Stores data in memory
  def new
    @button = "Create"
    @article = current_author.articles.build
  end
  # Stores data in database
  def create
    @article = current_author.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # Stores data in memory
  def edit
    @button = "Modify"
    @article =  Article.find(params[:id])
  end

  # Stores data in database
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Articles successfully modified."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, :notice => "Articles successfully deleted."
  end

  #security
  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def correct_author
    @article = current_author.articles.find_by(id: params[:id])
    redirect_to articles_path, notice: "You are not authorized to edit this article." if @article.nil?
  end

end
