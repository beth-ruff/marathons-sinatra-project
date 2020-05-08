class UpdateDatetimeDataType < ActiveRecord::Migration
  def up
    change_column :marathons, :date, :date
  end 
  
  def down 
    change_column :marathons, :date, :datetime
  end
end
