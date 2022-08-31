# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: @comment.model_name.human)
    else
      render_when_unsaved
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = t('controllers.common.notice_update', name: @comment.model_name.human)
      redirect_to @commentable
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = t('controllers.common.notice_destroy', name: Comment.model_name.human)
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
    redirect_to @commentable unless @comment.user == current_user
  end
end
