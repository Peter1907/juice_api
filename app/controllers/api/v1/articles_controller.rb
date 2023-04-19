class Api::V1::ArticlesController < ApplicationController
  def index
    render json: { res: response_hash("success", Article.all), user: @current_user }, status: :ok
  end

  def show
    render json: response_hash("success", Article.find(params[:id])), status: :ok
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: response_hash("success", article), status: :created
    else
      render json: response_hash("error", article.errors.full_messagees), status: :unprocessable_entity
    end
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: response_hash("success", article), status: :ok
    else
      render json: response_hash("error", article.errors.full_messages), status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    render json: response_hash("success", "Article deleted successfully"), status: :ok
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
