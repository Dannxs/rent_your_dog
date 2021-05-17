class AddBreedToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :breed, :string
  end
end
