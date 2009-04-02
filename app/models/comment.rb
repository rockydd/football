class Comment < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  belongs_to :commentable, :polymorphic=>true
end
