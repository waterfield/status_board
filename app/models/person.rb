class Person < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :timeoutable
  
  has_many :statuses
  has_one :status, :order => "created_at desc"
  
  validates :name, :presence => true
  
end
