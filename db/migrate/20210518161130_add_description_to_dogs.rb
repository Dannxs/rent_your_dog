class AddDescriptionToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :description, :text
  end
end
