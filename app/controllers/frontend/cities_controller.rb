# -*- encoding : utf-8 -*-
class Frontend::CitiesController < Frontend::BaseController
  def show
    @city = begin
      City.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      City.featured.first
    end
    @jobs = @city.jobs.sorted.page(params[:page]).per(40)
    @left_jobs = @jobs.map.each_with_index{|job, i| job if i.even?}.compact
    @right_jobs = @jobs.map.each_with_index{|job, i| job if i.odd?}.compact
  end

  def more
    @jobs = Job.where(city_id: City.unfeatured.map(&:id)).sorted.page(params[:page]).per(40)
    @left_jobs = @jobs.map.each_with_index{|job, i| job if i.even?}.compact
    @right_jobs = @jobs.map.each_with_index{|job, i| job if i.odd?}.compact
  end
end