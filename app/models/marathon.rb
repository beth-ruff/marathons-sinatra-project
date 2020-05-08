class Marathon < ActiveRecord::Base

belongs_to :user

    # validate worthy data
    validates :name, presence: true
    validates :date, presence: true 
    validates :location, presence: true 

end 