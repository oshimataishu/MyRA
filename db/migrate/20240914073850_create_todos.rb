class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :title, null: false
      t.datetime :deadline, null: false
      t.integer :status, null: false, default: 0
      t.integer :priority, null: false, default: 3
      t.timestamps
    end
  end
end
