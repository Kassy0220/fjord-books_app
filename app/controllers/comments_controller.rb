# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: @comment.model_name.human)
    else
      render_when_unsaved
    end
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
    redirect_to @commentable unless @comment.user == current_user
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = t('controllers.common.notice_update', name: @comment.model_name.human)
      redirect_to @commentable
    else
      render 'edit'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = t('controllers.common.notice_destroy', name: Comment.model_name.human)
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
