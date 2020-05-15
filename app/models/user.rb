class User < ActiveRecord::Base

validates :email, uniqueness: true
validates :name, presence: true 

has_secure_password
has_many :marathons

end 