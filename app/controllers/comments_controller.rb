class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  # POST /comments or /comments.json
  def create
    # @article = Article.find(params[:article_id])
    @comment = @article.comment.create(comment_params)

    # redirect_to post_path(@article)
    redirect_to @article
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    # @article = Article.find(params[:article_id])
    @comment = @article.comment.find(params[:id])
    @comment.destroy

    redirect_to @article
  end

  private
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:name, :text, :article_id)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end

