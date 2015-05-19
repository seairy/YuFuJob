# -*- encoding : utf-8 -*-
class Frontend::CitiesController < Frontend::BaseController
  def show
    @city = begin
      City.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      City.featured.first
    end
    @jobs = @city.jobs.sorted.page(params[:page]).per(40)
  end

  def more
    @jobs = Job.where(city_id: City.unfeatured.map(&:id)).sorted.page(params[:page]).per(40)
  end
end