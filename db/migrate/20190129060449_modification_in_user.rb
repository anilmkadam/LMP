class ModificationInUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :string, :limit => 10
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
