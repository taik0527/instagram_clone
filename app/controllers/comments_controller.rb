# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update(comment_update_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
