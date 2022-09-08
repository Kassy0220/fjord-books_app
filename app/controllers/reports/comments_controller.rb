# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  prepend_before_action :set_commentable

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def render_when_unsaved
    @report = @commentable
    @comments = @commentable.comments.order(:created_at)

    render 'reports/show'
  end
end
