class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  
  has_many :collaborations
  has_many :users, through: :collaborations
  
  validates :title, presence: :true
  validates :body, presence: :true
  
end
