class ChangeInLeavetableDropLeacecount < ActiveRecord::Migration[5.2]
  def change
    remove_column :leaves, :leave_count
  end
end
