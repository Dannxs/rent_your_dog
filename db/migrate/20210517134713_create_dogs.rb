class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :color
      t.string :size
      t.boolean :is_sterilized
      t.float :rating
      t.text :comments
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
