# -*- encoding : utf-8 -*-
class Frontend::JobsController < Frontend::BaseController
  def show
    @job = Job.find(params[:id])
    @city = @job.city
    @title = @job.title
  end
end
