class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_current_user

  def index
    @articles = Article.all
    @top = Article.top_article
    @categories = Category.order(:priority).limit(4).includes(:articles)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit
    unless @current_user == @article.author
      redirect_to article_path, notice: 'Seems like this article does not belong to you!'
    end

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :category_id, :image).merge(author_id: @current_user.id)
  end
end
