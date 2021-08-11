class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                    null: false
      t.text :description,                null: false
      t.integer :media_id,                null: false
      t.integer :genre_id,                null: false
      t.integer :preference_id,           null: false
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
