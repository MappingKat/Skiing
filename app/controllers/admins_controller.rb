class AdminsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @flagged_comments = MakeFlaggable::Flagging.where(flaggable_type: "Comment")
  end

end