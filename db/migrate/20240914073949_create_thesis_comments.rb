class CreateThesisComments < ActiveRecord::Migration[6.1]
  def change
    create_table :thesis_comments do |t|
      t.references :thesis, foreign_key: true, null: false
      t.references :customer, foreign_key: true, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
