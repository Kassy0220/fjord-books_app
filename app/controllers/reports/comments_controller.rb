# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def render_when_unsaved
    @report = @commentable
    # reports_controllerでセットされているインスタンス変数(@comment)が、空のコメントとして表示されないようにreloadする
    @comments = @commentable.comments.reload

    render 'reports/show'
  end
end
