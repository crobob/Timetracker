class User < ActiveRecord::Base
  belongs_to :company
  
  validates :fname, length: {minimum: 2}
  validates :lname, length: {minimum: 3}
  validates :company, presence: true
  
  has_many :works
  has_many :projects, :through => :works
  
  def to_s
    "#{fname} #{lname}"
  end
end
