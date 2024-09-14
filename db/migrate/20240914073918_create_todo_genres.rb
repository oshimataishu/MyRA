class CreateTodoGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_genres do |t|
      t.references :todo, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
