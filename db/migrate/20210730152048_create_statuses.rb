class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :level,                   null: false, default: "1"
      t.integer :inteligence,             null: false, default: "5"
      t.integer :consideration,           null: false, default: "5"
      t.integer :courage,                 null: false, default: "5"
      t.integer :humor,                   null: false, default: "5"
      t.integer :luck,                    null: false, default: "5"
      t.integer :decisiveness,            null: false, default: "5"
      t.integer :exp,                     null: false, default: "5"
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
