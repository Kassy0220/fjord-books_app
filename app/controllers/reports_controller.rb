# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]

  def index
    @reports = Report.order(id: 'DESC').page(params[:page]).per(10)
  end

  def show
    @report = Report.find(params[:id])
    @comment = @report.comments.build
    # buildされたコメントが空のコメントとして表示されないようにreloadする
    @comments = @report.comments.reload.order(:created_at)
  end

  def new
    @report = current_user.reports.build
  end

  def edit; end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      flash[:notice] = t('controllers.common.notice_create', name: Report.model_name.human)
      redirect_to @report
    else
      render 'new'
    end
  end

  def update
    if @report.update(report_params)
      flash[:notice] = t('controllers.common.notice_update', name: Report.model_name.human)
      redirect_to @report
    else
      render 'edit'
    end
  end

  def destroy
    @report.destroy

    flash[:notice] = t('controllers.common.notice_destroy', name: Report.model_name.human)
    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:title, :content)
  end

  def set_report
    @report = current_user.reports.find(params[:id])
  end
end
