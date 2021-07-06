class PostsController < ApplicationController
  def index
    @posts = Post.all
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
    @post = current_user.posts.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
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

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
