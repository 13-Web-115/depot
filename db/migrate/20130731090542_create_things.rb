class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :title
      t.text :content
      t.string :poster

      t.timestamps
    end
  end
end
