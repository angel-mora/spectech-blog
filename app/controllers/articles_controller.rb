class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_current_user

  def index
    @articles = Article.all
    @top = Article.top_article
    @category = @top.category
    @categories = Category.order(:priority).limit(4).includes(:articles)
    @current_category = Category.find(params[:id]) unless params[:id].nil? 
  end

  def show
    @category = @article.category
  end

  def new
    @article = Article.new
    @top = Article.top_article
    @category = @top.category
  end

  def edit
    unless @current_user == @article.author
      redirect_to category_article_path, notice: 'Seems like this article does not belong to you!'
    end

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    # binding.pry
    #@article = Article.find(params[:article_id])
    # @category = @category.articles.create(comment_params)
    # redirect_to article_path(@article)
    @art_builded = Article.new(title: article_params[:title], text: article_params[:text], author_id: @current_user.id, category_id: @current_category)
    #@article = @current_user.articles.build(article_params) # Article.new

    respond_to do |format|
      if @art_builded.save
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
    params.require(:article).permit(:title, :text, :category_id, :image, :author_id)
  end
end
