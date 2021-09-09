class AddPasscodeToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :passcode, :string
  end
end
