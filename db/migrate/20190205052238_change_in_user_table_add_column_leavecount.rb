class ChangeInUserTableAddColumnLeavecount < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :leave_count, :integer
  end
end
