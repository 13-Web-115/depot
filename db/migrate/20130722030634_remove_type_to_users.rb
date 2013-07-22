class RemoveTypeToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :type
  end
end
