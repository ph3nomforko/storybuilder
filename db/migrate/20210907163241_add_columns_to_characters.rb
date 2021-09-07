class AddColumnsToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :name, :string
    add_column :characters, :species, :string
    add_column :characters, :role, :string
    add_column :characters, :level, :integer
    add_column :characters, :description, :text
  end
end
