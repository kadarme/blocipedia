class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { (user.role == 'premium') || (user.role == 'admin') ? all : where(private: false) }
  
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations
  
  validates :title, presence: :true
  validates :body, presence: :true
  
end
