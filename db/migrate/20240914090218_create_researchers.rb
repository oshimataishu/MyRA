class CreateResearchers < ActiveRecord::Migration[6.1]
  def change
    create_table :researchers do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
