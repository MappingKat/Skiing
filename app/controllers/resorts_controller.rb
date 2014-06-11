class ResortsController < ApplicationController
  
  def index
    @resorts = Resort.all
  end

  def show
    @resort = Resort.find_or_update(params[:id])
    @resort = Resort.request_weather(params[:id])
  end

  def destroy
    @resort = Resort.find(params[:id])
    @resort.destroy
    redirect_to(resorts_path)
  end

end
