class CreateTodoComments < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_comments do |t|
      t.references :todo, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
