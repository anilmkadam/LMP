class CreateLeave < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.integer :user_id, :null => false
      t.string :leave_type, :null => false
      t.text :subject
      t.text :description, :limit => 500
      t.date :start_date, :null => false
      t.time :start_time
      t.date :end_date, :null => false
      t.time :end_time
      t.integer :status
      t.boolean :is_all_day
      t.string :email, :null => false
      t.float :leave_count
    end
  end
end
