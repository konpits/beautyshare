class PagesController < ApplicationController
  def home
    @services = Service.all.limit(4)
  end

  def index
    @services = Service.all
  end
end
