class Marathon < ActiveRecord::Base

    # validate worthy data
    validates :name, presence: true
    validates :date, presence: true 
    validates :location, presence: true 

end 