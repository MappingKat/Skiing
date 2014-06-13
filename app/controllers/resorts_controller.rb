class ResortsController < ApplicationController
  
  def index
    @q = Resort.search(params[:q])
    @all_resorts = @q.result(:distinct => true).order(:created_at)
    @resorts = @all_resorts.page(params[:page])
  end

  def show
    @resort = Resort.find_or_update(params[:id])
    @resort = Resort.request_weather(params[:id])
    @comment = @resort.comments.new
  end

  def destroy
    @resort = Resort.find(params[:id])
    @resort.destroy
    redirect_to(resorts_path)
  end

end
