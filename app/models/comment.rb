class Comment < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :family
  belongs_to :user
end
