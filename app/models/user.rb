class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, :email, :presence => true
  devise :database_authenticatable, :recoverable, 
         :rememberable, :trackable, :validatable
  has_many :comments, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
  
end
