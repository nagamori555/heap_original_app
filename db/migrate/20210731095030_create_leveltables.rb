class CreateLeveltables < ActiveRecord::Migration[6.0]
  def change
    create_table :leveltables do |t|
      t.integer :level,                   null: false
      t.integer :threshold,               null: false
      t.timestamps
    end
  end
end
