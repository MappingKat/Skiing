class ResortsController < ApplicationController
  
  def index
    @q = Resort.search(params[:q])
    @all_resorts = @q.result(:distinct => true).order(:created_at)
    @resorts = @all_resorts.page(params[:page])
  end

  def location 
    @resorts = Resort.all
  end

  def show
    @resort = Resort.find_or_update(params[:id])
    @resort = Resort.request_weather(params[:id])
    @resort_region = Resort.find_or_update_region(params[:id])
    @comment = @resort.comments.new
  end

  def destroy
    @resort = Resort.find(params[:id])
    @resort.destroy
    redirect_to(resorts_path)
  end

  def like
    @resort = Resort.find(params[:id])
    @like = @resort.liked_by current_user 

    redirect_to @resort, notice: "Liked!"
  end

  def unlike
    @resort = Resort.find(params[:id])
    @unlike = @resort.downvote_from current_user

    redirect_to @resort, notice: "Unliked!"
  end

  def search_resorts
    @resorts = Resort.where("name ilike ?", "%#{params[:q]}%").select([:name, :id, :region])

    respond_to do |format|
      format.json { render :json => @resorts.map{|r| { name: r.name, id: r.id, region: r.region } } }
    end
  end


end
