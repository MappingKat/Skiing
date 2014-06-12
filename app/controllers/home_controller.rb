class HomeController < ApplicationController
  def index
    @q = Resort.search(params[:q])
    @resorts = @q.result(:distinct => true).order(:created_at).page(params[:page])   
  end
end
