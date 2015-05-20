# -*- encoding : utf-8 -*-
class Frontend::BaseController < ApplicationController
  layout 'frontend'
  before_action :find_cities

  protected
    def find_cities
      @cities = City.all
    end
end
