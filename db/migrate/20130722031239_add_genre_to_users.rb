class AddGenreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :genre, :string, default: 'ordinary'
  end
end
