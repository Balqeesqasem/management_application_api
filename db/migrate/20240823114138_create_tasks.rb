class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :status, null: false, default: 0
      t.integer :tag
      t.integer :priority

      t.timestamps
    end

    # Add a unique index on tag and priority combination
    add_index :tasks, [:tag, :priority], unique: true, where: "tag IS NOT NULL AND priority IS NOT NULL"
  end
end
