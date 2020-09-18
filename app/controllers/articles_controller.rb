class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' was created!"
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "article '#{@article.title}' was Destroyed!"
    redirect_to article_path
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

end
