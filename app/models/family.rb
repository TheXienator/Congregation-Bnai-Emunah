class Family < ActiveRecord::Base
  validates :name, :people, :presence => true
  has_many :comments, :dependent => :destroy
  
  def display_name
    "#{name}, #{people}"
  end
end
