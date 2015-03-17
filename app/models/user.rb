class User < ActiveRecord::Base
  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role


  
  has_many :collaborations
  has_many :wikis, through: :collaborations
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


 def admin?
   role == :admin
 end
 
 def premium?
  role == :premium
 end

 def standard?
   role == :standard
 end
  
 private
  
 def set_default_role
   self.role ||= :standard
 end
end
