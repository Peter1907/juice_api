class Api::V1::ArticlesController < ApplicationController
  def index
    render json: {
      message: "success",
      articles: Article.all
    }, status: :ok
  end

  def show
    render json: {
      message: "success",
      article: Article.find(params[:id])
    }, status: :ok
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: {
        message: "success",
        article: article
      }, status: :ok
    else
      render json: {
        message: "error",
        errors: article.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: {
        message: "success",
        article: article
      }, status: :ok
    else
      render json: {
        message: "error",
        errors: article.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    render json: { message: "Article deleted" }, status: :ok
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
