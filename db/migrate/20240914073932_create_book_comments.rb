class CreateBookComments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_comments do |t|
      t.references :book, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.text :comment, null: false
      t.integer :page_number
      t.text :quote
      t.timestamps
    end
  end
end
