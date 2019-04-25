class UserTableModification < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    add_column :users, :lastname, :string
    add_column :users, :dob, :date
    add_column :users, :phone, :string, :limit => 10 #By default SQL String limit 255 character 
    #Ex:- :limit => 40
    
  end
end
