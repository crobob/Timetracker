class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company
  
  validates :fname, length: {minimum: 2}
  validates :lname, length: {minimum: 3}
  validates :company, presence: true
  validates :admin, presence: true
  
  has_many :works
  has_many :projects, :through => :works
  has_many :projects_owned, :foreign_key => 'owner_id', :class_name => 'Project'
  
  def to_s
    "#{fname} #{lname}"
  end
end
