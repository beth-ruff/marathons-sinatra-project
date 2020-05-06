class CreateMarathons < ActiveRecord::Migration
  def change
    create_table :marathons do |t|
      t.string :name
      t.datetime :date
      t.string :location
    end 
  end
end
