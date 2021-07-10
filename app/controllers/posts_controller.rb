# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = if current_user
               current_user.feed.includes(:user).page(params[:page]).order(created_at: :desc)
             else
               Post.all.includes(:user).page(params[:page]).order(created_at: :desc)
             end
    @users = User.recent(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post), success: '投稿を作成しました'
    else
      flash.now[:danger] = '投稿を作成に失敗しました'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    params[:post][:image_ids]&.each do |image_id|
      image = @post.images.find(image_id)
      image.purge
    end
    if @post.update(post_params)
      flash[:success] = '編集しました'
      redirect_to post_path(@post), success: '投稿を更新しました'
    else
      flash.now[:danger] = '投稿を更新できません'
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, success: '投稿を削除しました'
  end

  def like_posts
    @posts = current_user.like_posts.includes(:user).page(params[:page]).order(created_at: :desc).per(10)
    render :index
  end

  def search
    @posts = @search_form.search.includes(:user).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
  
end
