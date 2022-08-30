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

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
