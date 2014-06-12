class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_resort

  def create 
    if params[:comment][:commentable_type] == "Resort"
      @comment = @album.comments.build(params[:comment])

      if @comment.save
        redirect_to resort_path(@resort)
      end
    end
  end


  def load_resort
    @resort = Resort.find(params[:resort_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(:back)
  end


end