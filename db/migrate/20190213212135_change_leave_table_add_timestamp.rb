class ChangeLeaveTableAddTimestamp < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :created_at, :datetime, :null => false
    add_column :leaves, :updated_at, :datetime, :null => false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
