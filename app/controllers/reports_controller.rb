class ReportsController < ApplicationController

  def index
    @reports = Report.order(id: 'DESC').page(params[:page]).per(10)
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = current_user.reports.build
  end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      flash[:notice] = t('controllers.common.notice_create', name: Report.model_name.human)
      redirect_to @report
    else
      render 'new'
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
