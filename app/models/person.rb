class Person < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :timeoutable
  
  has_many :statuses
  has_one :status, :order => "created_at desc"
  has_and_belongs_to_many :projects
  
  validates :name, :presence => true

  def member_of? project
    projects.include? project
  end
end
