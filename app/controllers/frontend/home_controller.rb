# -*- encoding : utf-8 -*-
class Frontend::HomeController < Frontend::BaseController
  def index
    @jobs = Job.sorted.page(params[:page]).per(40)
  end
end