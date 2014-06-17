class CommentsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  before_filter :load_resort

  def create 
    if params[:comment][:commentable_type] == "Resort"
      @comment = @resort.comments.build(params[:comment])

      if @comment.save
        redirect_to resort_path(@resort)
      end
    end
  end

  def load_resort
    @resort = Resort.find(params[:resort_id])
  end

  def inappropriate
    @comment = Comment.find(params[:id])
    current_user.flag(@comment, :inappropriate)
    redirect_to :back, notice: "You have reported this comment."
  end

  def delete_inappropriate
    @comment = Comment.find(params[:id])
    @comment.flaggings.destroy_all
    redirect_to admin_index_path, notice: "You have removed the flag."
  end

  def destroy
    @comment = @resort.comments.find(params[:id])
    @comment.destroy
    redirect_to(@resort)
  end

end