class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :content
      t.string :questioner

      t.timestamps
    end
  end
end
