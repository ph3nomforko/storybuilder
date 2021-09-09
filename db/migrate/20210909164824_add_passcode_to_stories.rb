class AddPasscodeToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :passcode, :string
  end
end
