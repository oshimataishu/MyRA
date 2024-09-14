class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :title, null: false
      t.string :author, null: false
      t.string :company
      t.integer :status, null: false, default: 0
      t.integer :star, null: false, default: 3
      t.timestamps
    end
  end
end
