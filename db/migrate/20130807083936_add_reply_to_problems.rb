class AddReplyToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :reply, :text
  end
end
