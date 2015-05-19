# -*- encoding : utf-8 -*-
class Cms::CitiesController < Cms::BaseController
  
  def index
    @cities = City.page(params[:page])
  end
  
  def show
    @city = City.find(params[:id])
  end
  
  def new
    @city = City.new
  end
  
  def edit
    @city = City.find(params[:id])
  end
  
  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to [:cms, @city], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @city = City.find(params[:id])
    if @city.update_attributes(city_params)
      redirect_to [:cms, @city], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end

  protected
  def city_params
    params.require(:city).permit!
  end
end
