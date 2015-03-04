class Company < ActiveRecord::Base
  validates :name, length: { minimum: 5 } 
  
  has_many :users
  has_many :projects
  
  def to_s
    name
  end
end
