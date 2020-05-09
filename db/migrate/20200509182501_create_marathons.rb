class CreateMarathons < ActiveRecord::Migration
  def change
    create_table :marathons do |t|
      t.string :name
      t.date :date 
      t.string :location
      t.integer :user_id
    end 
  end
end
