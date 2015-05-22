# -*- encoding : utf-8 -*-
class Cms::JobsController < Cms::BaseController
  def index
    @jobs = Job.sorted.page(params[:page])
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to [:cms, @job], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      redirect_to [:cms, @job], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to cms_jobs_path, notice: '删除成功！'
  end

  def toggle_visible
    @job = Job.find(params[:id])
    @job.update!(visible: !@job.visible?)
    redirect_to cms_jobs_path(page: params[:page]), notice: '更新显示状态成功！'
  end

  protected
  def job_params
    params.require(:job).permit!
  end
end
