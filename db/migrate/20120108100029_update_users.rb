class UpdateUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :name, :string
    add_column :users, :skypename, :string
    add_column :users, :icq, :integer
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :name
    remove_column :users, :skypename
    remove_column :users, :icq
  end
end