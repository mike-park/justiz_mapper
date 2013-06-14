class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :category
      t.string :state
      t.string :name
      t.text :blob

      t.timestamps
    end

    add_index(:courts, :name)
    add_index(:courts, :category)
    add_index(:courts, :state)
  end
end
