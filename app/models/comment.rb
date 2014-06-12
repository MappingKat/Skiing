class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  belongs_to :commentable, :polymorphic => true

  attr_accessible :title, :comment, :user_id, :commentable_type, :flaggable, :flagger, :flag

  default_scope :order => 'created_at ASC'

  
  acts_as_votable
  make_flaggable :inappropriate

  belongs_to :user
end
